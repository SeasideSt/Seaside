accessing
statusString
	^ 'zinc on port ', self port greaseString, 
		( self isRunning ifTrue: [ ' [running]' ] ifFalse: [ ' [stopped]' ] )