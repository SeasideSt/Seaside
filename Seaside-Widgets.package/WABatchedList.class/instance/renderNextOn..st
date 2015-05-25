rendering
renderNextOn: html
	html space.
	self isOnLastPage
		ifFalse: [ html anchor callback: [ self nextPage ]; with: '>>' ]
		ifTrue: [ html text: '>>' ]