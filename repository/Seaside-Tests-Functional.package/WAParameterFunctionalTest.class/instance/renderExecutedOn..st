rendering
renderExecutedOn: html
	html strong: (self wasSuccessful ifTrue: [ 'success' ] ifFalse: [ 'fail' ])