accessing
baseUrlForLibrary
	| resourceBaseUrl |
	resourceBaseUrl := self resourceBaseUrl.
	^ resourceBaseUrl isNil
		ifTrue: [ self url ]
		ifFalse: [ resourceBaseUrl copy ]