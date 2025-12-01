Extension { #name : 'WAMetaElement' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WAMetaElement >> turboPrefetch: aString [
	"Prefetching links is enabled by default since Turbo v8, 
	but you can disable it by adding this meta tag to your page with value false."

	self name: 'turbo-prefetch'.
	self content: aString
]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAMetaElement >> turboRefreshMethod: aString [
	
	"The possible values are 'morph' or 'replace' (the default).
	When it is morph, when a page refresh happens, instead of replacing the page’s <body> contents,
	Turbo will only update the DOM elements that have changed, keeping the rest untouched. 
	This approach delivers better sensations because it keeps the screen state.
	https://turbo.hotwired.dev/handbook/page_refreshes.html"

	self name: 'turbo-refresh-method'.
	self content: aString
]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAMetaElement >> turboRefreshScroll: aString [
	
	"The possible values are 'preserve' or 'reset' (the default). 
	When it is preserve, when a page refresh happens, Turbo will keep the page’s vertical and horizontal scroll.
	https://turbo.hotwired.dev/handbook/page_refreshes.html#scroll-preservation"

	self name: 'turbo-refresh-scroll'.
	self content: aString
]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAMetaElement >> turboRoot: aString [
	"Include a <meta name=""turbo-root""> element in your pages’ <head> to scope Turbo Drive to a particular root location. 
	Turbo Drive will only load same-origin URLs that are prefixed with this path.
	https://turbo.hotwired.dev/handbook/drive#setting-a-root-location"

	self name: 'turbo-root'.
	self content: aString
]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAMetaElement >> turboVisitControl: aString [
	"Using the value 'reload' will perform a full page reload whenever Turbo navigates to the page, 
	including when the request originates from a <turbo-frame>"

	self name: 'turbo-visit-control'.
	self content: aString
]
