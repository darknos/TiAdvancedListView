/**
 * TiAdvancedListView
 * Copyright (c) 2009-2013 by Sergey Nosenko. All Rights Reserved.
 */

#define USE_TI_UILISTVIEW
#import "TiUIListView.h"

@interface TiAdvancedListViewListView : TiUIListView <UIScrollViewDelegate>{
@private
	UIView * tableHeaderPullView;
    BOOL stopImageLoaderOnScroll;
}

@end
