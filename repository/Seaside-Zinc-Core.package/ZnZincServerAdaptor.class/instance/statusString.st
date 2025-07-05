accessing
statusString

	^ 'Zinc on port {1} {2}' format: { 
			  self port greaseString .
			  (self isRunning
				   ifTrue: [ ' [running]' ]
				   ifFalse: [ ' [stopped]' ]) }