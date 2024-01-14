initialization
initialize

	super initialize.
	self matchesAny:
		#( '``html jQuery ajax callback: ``@block;script:``@block2'
		   '``html jQuery ajax script: ``@block;callback:``@block2'
		   '``html jQuery ajax callback: ``@block;callback:``@block2'
		   '``html jQuery ajax callback: ``@block;html:``@block2'
		   '``html jQuery ajax html: ``@block;callback:``@block2' )