/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiUIView.h"
#import "TiAdvancedListViewListViewProxy.h"

@interface TiAdvancedListViewListView : TiUIView <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate, UISearchDisplayDelegate, TiScrolling, TiProxyObserver > {
@private
    BOOL stopImageLoaderOnScroll;
}

#pragma mark - Private APIs

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) BOOL isSearchActive;

- (void)updateSearchResults:(id)unused;
- (void)setDictTemplates_:(id)args;
- (void)setContentInsets_:(id)value withObject:(id)props;
- (void)deselectAll:(BOOL)animated;

+ (UITableViewRowAnimation)animationStyleForProperties:(NSDictionary*)properties;

@end

