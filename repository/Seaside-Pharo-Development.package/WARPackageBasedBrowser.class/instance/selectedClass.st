private
selectedClass
	| class |
	class := selectedClass.
	(class notNil and: [ showInstance not ]) ifTrue: [ 
		class := (class respondsTo: #classSide)
			ifTrue: [ class classSide ]
			ifFalse: [ class theMetaClass ] ].
	^ class