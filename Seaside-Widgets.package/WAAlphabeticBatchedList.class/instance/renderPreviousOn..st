rendering
renderPreviousOn: html
	self isOnFirstPage
		ifFalse: [ html anchor callback: [ self previousPage ]; with: '<<' ]
		ifTrue: [ html text: '<<' ].
	html space