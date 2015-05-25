convenience
search: aSearchBlock callback: aCallbackBlock
	self search: aSearchBlock labels: [ :each | each greaseString ] callback: aCallbackBlock