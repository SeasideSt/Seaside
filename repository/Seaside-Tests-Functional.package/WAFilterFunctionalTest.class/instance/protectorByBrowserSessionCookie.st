actions
protectorByBrowserSessionCookie
	| filter |
	"We could use #filterWith:during: but that requires Flow."
	filter := WASessionCookieProtectionFilter new.
	self session addFilter: filter.
	child inform: 'Open this page in a different browser by copying the complete URL. Seaside should reply with a forbidden message. Closing this dialog should remove the filter.' onAnswer: [ self session removeFilter: filter ]