/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */


#import <UIKit/UIKit.h>
#import "TiAdvancedListViewListView.h"
#import "TiAdvancedListViewListItemProxy.h"
#import "TiSelectedCellbackgroundView.h"

enum {
	TiUIListItemTemplateStyleCustom = -1
};

@interface TiAdvancedListViewListItem : UITableViewCell
{
	TiGradientLayer * gradientLayer;
	TiGradient * backgroundGradient;
	TiGradient * selectedBackgroundGradient;
}

@property (nonatomic, readonly) NSInteger templateStyle;
@property (nonatomic, readonly) TiAdvancedListViewListItemProxy *proxy;
@property (nonatomic, readwrite, retain) NSDictionary *dataItem;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier proxy:(TiAdvancedListViewListItemProxy *)proxy;
- (id)initWithProxy:(TiAdvancedListViewListItemProxy *)proxy reuseIdentifier:(NSString *)reuseIdentifier;

- (BOOL)canApplyDataItem:(NSDictionary *)otherItem;
- (void)setPosition:(int)position isGrouped:(BOOL)grouped;
- (void)configureCellBackground;
@end


