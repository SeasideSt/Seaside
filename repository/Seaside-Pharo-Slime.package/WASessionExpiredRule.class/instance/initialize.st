initialization
initialize
	super initialize.
	self rewriteRule
		replaceMethod: 'expired
			| `@temps | 
			`@.Statements'
		with: 'unregistered
			| `@temps | 
			`@.Statements'