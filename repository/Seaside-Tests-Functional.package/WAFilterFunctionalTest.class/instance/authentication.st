actions
authentication
	| filter |
	"We could use #filterWith:during: but that requires Flow."
	filter := WAAuthenticationFilter new
			authenticator: self;
			yourself.
	self session addFilter: filter.
	child inform: 'Congratulations, you have been authenticated. The new filter should be visible in the list above. Clicking on "ok" should remove the filter. Using the back button and hitting refresh should show the filter again.' onAnswer: [ self session removeFilter: filter ]