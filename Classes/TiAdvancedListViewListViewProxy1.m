/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiAdvancedListViewListViewProxy.h"
#import "TiUtils.h"

@implementation TiAdvancedListViewListViewProxy

-(void)setContentInsets:(id)args
{
	ENSURE_UI_THREAD(setContentInsets,args);
	id arg1;
	id arg2;
	if ([args isKindOfClass:[NSDictionary class]])
	{
		arg1 = args;
		arg2 = [NSDictionary dictionary];
	}
	else
	{
		arg1 = [args objectAtIndex:0];
		arg2 = [args count] > 1 ? [args objectAtIndex:1] : [NSDictionary dictionary];
	}
	[[self view] performSelector:@selector(setContentInsets_:withObject:) withObject:arg1 withObject:arg2];
}

-(void)changeSeparatorStyle:(id)arg
{
    ENSURE_UI_THREAD(chngeSeparatorStyle,arg);
    [[self view] performSelector:@selector(setSeparatorStyle_:withObject:) withObject:arg];
}

-(void)changeSeparatorColor:(id)arg
{
    ENSURE_UI_THREAD(chngeSeparatorStyle,arg);
    [[self view] performSelector:@selector(setSeparatorColor_:withObject:) withObject:arg];
}



@end
