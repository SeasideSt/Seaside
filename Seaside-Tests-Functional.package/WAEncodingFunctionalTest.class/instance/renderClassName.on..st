rendering
renderClassName: aString on: html 
	aString isNil ifTrue: [ ^ self ].
	html paragraph: [
		html strong: 'Class: '.
		html text: aString class name ]