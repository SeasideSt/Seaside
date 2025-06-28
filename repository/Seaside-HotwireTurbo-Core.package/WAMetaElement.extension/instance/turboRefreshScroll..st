*Seaside-HotwireTurbo-Core
turboRefreshScroll: aString
	
	"The possible values are 'preserve' or 'reset' (the default). 
	When it is preserve, when a page refresh happens, Turbo will keep the page’s vertical and horizontal scroll.
	https://turbo.hotwired.dev/handbook/page_refreshes.html#scroll-preservation"

	self name: 'turbo-refresh-scroll'.
	self content: aString