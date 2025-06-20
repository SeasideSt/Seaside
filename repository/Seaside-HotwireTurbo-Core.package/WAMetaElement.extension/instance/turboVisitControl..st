*Seaside-HotwireTurbo-Core
turboVisitControl: aString
	"Using the value 'reload' will perform a full page reload whenever Turbo navigates to the page, 
	including when the request originates from a <turbo-frame>"

	self name: 'turbo-visit-control'.
	self content: aString