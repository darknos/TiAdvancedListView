# TiAdvancedListView Module

## Description

Advanced ListView module with scroll, scrollend, dragstart, dragend events and ability to stop image loader on scroll to improve performance

## Accessing the TiAdvancedListView Module

To access this module from JavaScript, you would do the following:

	var TiAdvancedListView = require("ti.advanced.list.view");

The TiAdvancedListView variable is a reference to the Module object.	

## Properties

### stopImageLoaderOnScroll : boolean

Default: false

If true image loader suspended on scroll to increase performance

### headerPullView : Titanium.UI.View

View positioned above the first row that is only revealed when the user drags the table contents down.

A headerPullView is a UI control that is often used to provide a convenient way for the user to refresh a table's data. Typically used with the setContentInsets method.

The TableView Refresh with headerPullView guide describes one way a headerPullView may be untilized:

http://docs.appcelerator.com/titanium/latest/#!/guide/TableView_Refresh_with_headerPullView

## Methods

### setContentInsets( TableViewEdgeInsets edgeInsets, [TableViewContentInsetOption animated] )

Sets this tableview's content insets.

A table view is essentially a scroll view that contains a set of static row views that represents the content. Thus, the setContentInsets method facilitates a margin, or inset, distance between the content and the container scroll view.

Typically used with the headerPullView property.

## Events

### dragend

Fired when the scrollable region stops being dragged.

A dragging gesture is when a touch remains in contact with the display to physically drag the view, as opposed to it being the result of scrolling momentum.

### dragstart

Fired when the scrollable region starts being dragged.

A dragging gesture is when a touch remains in contact with the display to physically drag the view, as opposed to it being the result of scrolling momentum.

### scroll

Fired when the table view is scrolled.

### scrollend

Fired when the table view stops scrolling.

## Usage

var listview = TiAdvancedListView.createListView({
	sections: [section],
	stopImageLoaderOnScroll: true
}); 

## Author

Sergey Nosenko

http://developer.appcelerator.com/user/1243142/sergey-nosenko

## License

Copyright (c) 2013 Sergey Nosenko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
