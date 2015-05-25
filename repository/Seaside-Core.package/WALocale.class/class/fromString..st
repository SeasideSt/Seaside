instance creation
fromString: aString
	| language country delimiter |
	delimiter := (aString includes: $_)
		ifTrue: [ $_ ]
		ifFalse: [ $- ].
	language := aString copyUpTo: delimiter.
	country := aString copyAfter: delimiter.
	country isEmpty ifTrue: [ country := nil ].
	^ self
		language: language
		country: country