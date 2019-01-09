private
findClasses: aSymbol
	| class |
	class := Smalltalk classNamed: aSymbol.
	^ class isNil 
		ifTrue: [ #() ]
		ifFalse: [ class withAllSubclasses asArray ]
	