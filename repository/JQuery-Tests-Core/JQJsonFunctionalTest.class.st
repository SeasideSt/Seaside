Class {
	#name : #JQJsonFunctionalTest,
	#superclass : #JQFunctionalTest,
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #rendering }
JQJsonFunctionalTest >> renderContentOn: html [
	self renderExternalJsonOn: html.
	self renderJsonCallbackOn: html
]

{ #category : #rendering }
JQJsonFunctionalTest >> renderExternalJsonOn: html [
	html paragraph: 'Load some recent Seaside pictures from the Flickr JSONP API:'.
	html div id: 'images'.
	html document 
		addLoadScript: (html jQuery getJson
			url: 'http://api.flickr.com/services/feeds/photos_public.gne?tags=seaside&format=json&jsoncallback=?';
			onSuccess: '$.each(arguments[0].items, function(index, each) {
				$("<img/>").attr("src", each.media.m).attr("title", each.title).appendTo("#images");
			});')
]

{ #category : #rendering }
JQJsonFunctionalTest >> renderJsonCallbackOn: html [

	html paragraph: 'Load Json served by Seaside:'.
	html textArea id: 'textarea'.
	html document addLoadScript: 
		(html jQuery getJson 
				json: [ :json | self seasidePackagesOn: json ];
				onSuccess: ((html jQuery id: 'textarea') value: (JSStream on: 'JSON.stringify(arguments[0])')) asFunction)
							
]

{ #category : #private }
JQJsonFunctionalTest >> seasidePackagesOn: json [

	json array: [
		GRPackage grPackages do:[ :grPackage |
			json object: [ 
				json key: 'name' value: grPackage name.
				json key: 'dependencies' value: [  
					json array: [ grPackage dependencies do: [ :dep |
						json value: [ json string: dep name ] ] ] ] ] ] ]
]

{ #category : #accessing }
JQJsonFunctionalTest >> selectors [
	^ #(renderExternalJsonOn: renderJsonCallbackOn:)
]

{ #category : #hooks }
JQJsonFunctionalTest >> style [
	^ '#images { white-space: nowrap; overflow: scroll; overflow-y: hidden; }
#images img { padding: 0 10px 10px 0; vertical-align: middle; }
#textarea { width: 50em; height: 10em; }'
]

{ #category : #accessing }
JQJsonFunctionalTest >> title [
	^ 'Load JSON'
]
