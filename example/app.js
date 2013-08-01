var template = {
    properties : {
    },
    childTemplates : [{
        type : 'Ti.UI.ImageView',
        bindId : 'avatar',
        properties : {
            left : 10,
            width : 40,
            height : 40
        },
    }, {
        type : 'Ti.UI.Label',
        bindId : 'username',
        properties : {
            color : 'white',
            font : {
                fontFamily : 'Arial',
                fontSize : 13,
                fontWeight : 'bold'
            },
            left : 60,
            top : 5,
            width : 200,
            height : 10
        },
    }, {
        type : 'Ti.UI.Label',
        bindId : 'message',
        properties : {
            color : 'white',
            font : {
                fontFamily : 'Arial',
                fontSize : 11
            },
            left : 60,
            top : 20,
            width : 200,
            bottom : 5
        },
    }]
};

var win = Ti.UI.createWindow({
    title : 'Twitter Feed'
});
var section = Ti.UI.createListSection();
var v = Ti.UI.createView({
    backgroundColor : "red",
    height : 60,
    top : 0,
    width : 300,
    visible : true
});
var listView = require("ti.advanced.list.view").createListView({
    headerPullView : v,
    sections : [section],
    templates : {
        'template' : template
    },
    defaultItemTemplate : 'template',
    backgroundColor : 'transparent',
    rowHeight : 80
});


win.add(listView);
win.open();

var url = "http://api.twitter.com/1/lists/statuses.json?slug=mobile-award-winners&owner_screen_name=appcelerator&include_rts=1&per_page=10";
var loader = Titanium.Network.createHTTPClient();
var page = 1;

listView.addEventListener("scroll", function(e) {
    if (e.contentSize.height + e.contentOffset.x < e.size.height * 2) {
        loader.open("GET", url+'&page='+page);
        loader.send();
    } 
});

loader.onload = function() {
    var tweets = eval('(' + this.responseText + ')');
    Ti.API.info(this.responseText);
    var items = [];
    for (var i = 0; i < tweets.length; ++i) {
        items.push({
            username : {
                text : tweets[i].user.screen_name
            },
            message : {
                text : tweets[i].text
            },
            avatar : {
                image : tweets[i].user.profile_image_url
            }
        });
    }
    section.appendItems(items); ++page;
};
loader.open("GET", url + '&page=' + page);
loader.send();
win.addEventListener('close', function() {
    loader.abort();
});
