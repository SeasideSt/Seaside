*Seaside-HotwireTurbo-Core
turboRoot: aString
	"Include a <meta name=""turbo-root""> element in your pages’ <head> to scope Turbo Drive to a particular root location. 
	Turbo Drive will only load same-origin URLs that are prefixed with this path.
	https://turbo.hotwired.dev/handbook/drive#setting-a-root-location"

	self name: 'turbo-root'.
	self content: aString