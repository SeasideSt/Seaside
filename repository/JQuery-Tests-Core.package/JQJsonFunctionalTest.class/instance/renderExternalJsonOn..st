rendering
renderExternalJsonOn: html
	html paragraph: 'Load some recent Seaside pictures from the Flickr JSONP API:'.
	html div id: 'images'.
	html document 
		addLoadScript: (html jQuery getJson
			url: 'http://api.flickr.com/services/feeds/photos_public.gne?tags=seaside&format=json&jsoncallback=?';
			onSuccess: '$.each(arguments[0].items, function(index, each) {
				$("<img/>").attr("src", each.media.m).attr("title", each.title).appendTo("#images");
			});')