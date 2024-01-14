initialization
initialize

	super initialize.
	self ajaxSelectors do: [ :selector |
		self matches: '`@receiver ' , selector , ' `@method: `@arguments' ]