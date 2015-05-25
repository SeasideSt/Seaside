actions
protector
	| filter |
	"We could use #filterWith:during: but that requires Flow."
	filter := WAProtectionFilter new.
	self session addFilter: filter.
	child inform: 'Open this page on a different computer by copying the complete URL to a machine with a different IP address. Seaside should reply with a forbidden message. Closing this dialog should remove the filter.' onAnswer: [ self session removeFilter: filter ]