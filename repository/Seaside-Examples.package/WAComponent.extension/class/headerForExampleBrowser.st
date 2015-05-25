*seaside-examples-misc
headerForExampleBrowser
	^ self name = self description
		ifTrue: [ self name ]
		ifFalse: [ self description , ' (' , self name , ')' ]