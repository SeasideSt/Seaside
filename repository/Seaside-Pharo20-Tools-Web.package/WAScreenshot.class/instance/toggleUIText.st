accessing
toggleUIText
	^ self uiProcess isSuspended
		ifFalse: [ 'Suspend UI Process' ]
		ifTrue: [ 'Resume UI Process' ]