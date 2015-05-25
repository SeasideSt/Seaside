accessing
sourceCode
	^ (class selectors includes: selector)
		ifTrue: [ class sourceCodeAt: selector ]