private
selectedClass
	| class |
	class := selectedClass.
	(class notNil and: [ showInstance not ]) ifTrue: [ 
		class := class theMetaClass ].
	^ class