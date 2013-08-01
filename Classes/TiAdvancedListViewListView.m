/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiUIViewProxy.h"
#import "ImageLoader.h"
#import "TiApp.h"
#import "TiAdvancedListViewListView.h"

@implementation TiAdvancedListViewListView

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
	[super frameSizeChanged:frame bounds:bounds];
	
	if (tableHeaderPullView!=nil)
	{
		tableHeaderPullView.frame = CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
		TiViewProxy *proxy = [self.proxy valueForUndefinedKey:@"headerPullView"];
		[TiUtils setView:[proxy view] positionRect:[tableHeaderPullView bounds]];
		[proxy windowWillOpen];
		[proxy layoutChildren:NO];
	}
	
}

-(void)setStopImageLoaderOnScroll_:(id)args
{
    stopImageLoaderOnScroll = [TiUtils boolValue:args];
}

-(void)setHeaderPullView_:(id)value
{
	ENSURE_TYPE_OR_NIL(value,TiViewProxy);
	if (value==nil)
	{
		[tableHeaderPullView removeFromSuperview];
		RELEASE_TO_NIL(tableHeaderPullView);
	}
	else
	{
        if (self.tableView.frame.size.width==0)
        {
            [self performSelector:@selector(setHeaderPullView_:) withObject:value afterDelay:0.1];
            return;
        }
		tableHeaderPullView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
		tableHeaderPullView.backgroundColor = [UIColor lightGrayColor];
		UIView *view = [value view];
		[[self tableView] addSubview:tableHeaderPullView];
		[tableHeaderPullView addSubview:view];
		[TiUtils setView:view positionRect:[tableHeaderPullView bounds]];
		[value windowWillOpen];
		[value layoutChildren:NO];
	}
}


-(void)setContentInsets_:(id)value withObject:(id)props
{
	UIEdgeInsets insets = [TiUtils contentInsets:value];
	BOOL animated = [TiUtils boolValue:@"animated" properties:props def:NO];
    void (^setInset)(void) = ^{
        [self.tableView setContentInset:insets];
    };
    if (animated) {
        double duration = [TiUtils doubleValue:@"duration" properties:props def:300]/1000;
        [UIView animateWithDuration:duration animations:setInset];
    }
    else {
        setInset();
    }
}

#pragma Scroll View Delegate

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
	// suspend image loader while we're scrolling to improve performance
    if (stopImageLoaderOnScroll) {
        [[ImageLoader sharedLoader] suspend];
    }
	return YES;
}

- (NSDictionary *) eventObjectForScrollView: (UIScrollView *) scrollView
{
	return [NSDictionary dictionaryWithObjectsAndKeys:
			[TiUtils pointToDictionary:scrollView.contentOffset],@"contentOffset",
			[TiUtils sizeToDictionary:scrollView.contentSize], @"contentSize",
			[TiUtils sizeToDictionary:self.tableView.bounds.size], @"size",
			nil];
}

- (void)fireScrollEvent:(UIScrollView *)scrollView {
	if ([self.proxy _hasListeners:@"scroll"])
	{
		[self.proxy fireEvent:@"scroll" withObject:[self eventObjectForScrollView:scrollView]];
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if (scrollView.isDragging || scrollView.isDecelerating)
	{
        [self fireScrollEvent:scrollView];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    [self fireScrollEvent:scrollView];
    
	// resume image loader when we're done scrolling
    if (stopImageLoaderOnScroll) {
        [[ImageLoader sharedLoader] resume];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	// suspend image loader while we're scrolling to improve performance
    if (stopImageLoaderOnScroll) {
        [[ImageLoader sharedLoader] suspend];
    }
    if([self.proxy _hasListeners:@"dragstart"])
	{
        [self.proxy fireEvent:@"dragstart" withObject:nil];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	if (decelerate==NO)
	{
		// resume image loader when we're done scrolling
        if (stopImageLoaderOnScroll) {
            [[ImageLoader sharedLoader] resume];
        }
	}
	if ([self.proxy _hasListeners:@"dragend"])
	{
		[self.proxy fireEvent:@"dragend" withObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:decelerate],@"decelerate",nil]]	;
	}
    
    // Update keyboard status to insure that any fields actively being edited remain in view
    if ([[[TiApp app] controller] keyboardVisible]) {
        [[[TiApp app] controller] performSelector:@selector(handleNewKeyboardStatus) withObject:nil afterDelay:0.0];
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	// resume image loader when we're done scrolling
    if (stopImageLoaderOnScroll) {
        [[ImageLoader sharedLoader] resume];
    }
	if ([self.proxy _hasListeners:@"scrollend"])
	{
		[self.proxy fireEvent:@"scrollend" withObject:[self eventObjectForScrollView:scrollView]];
	}
}

-(void)setSeparatorStyle_:(id)arg
{
	[[self tableView] setSeparatorStyle:[TiUtils intValue:arg]];
}

-(void)setSeparatorColor_:(id)arg
{
	TiColor *color = [TiUtils colorValue:arg];
	[[self tableView] setSeparatorColor:[color _color]];
}




@end
