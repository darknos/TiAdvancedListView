/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiViewProxy.h"

@class TiAdvancedListViewListItem;
@class TiAdvancedListViewListViewProxy;

@interface TiAdvancedListViewListItemProxy : TiViewProxy < TiViewEventOverrideDelegate, TiProxyDelegate >

@property (nonatomic, readwrite, assign) TiAdvancedListViewListItem *listItem;
@property (nonatomic, readwrite, retain) NSIndexPath *indexPath;

- (id)initWithListViewProxy:(TiAdvancedListViewListViewProxy *)listViewProxy inContext:(id<TiEvaluator>)context;

@end

