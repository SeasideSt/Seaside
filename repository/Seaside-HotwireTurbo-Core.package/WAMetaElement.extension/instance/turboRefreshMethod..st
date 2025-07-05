*Seaside-HotwireTurbo-Core
turboRefreshMethod: aString
	
	"The possible values are 'morph' or 'replace' (the default).
	When it is morph, when a page refresh happens, instead of replacing the page’s <body> contents,
	Turbo will only update the DOM elements that have changed, keeping the rest untouched. 
	This approach delivers better sensations because it keeps the screen state.
	https://turbo.hotwired.dev/handbook/page_refreshes.html"

	self name: 'turbo-refresh-method'.
	self content: aString