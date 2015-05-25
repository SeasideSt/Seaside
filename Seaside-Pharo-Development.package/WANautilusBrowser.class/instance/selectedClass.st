private
selectedClass
	selectedClass := nautilus selectedClass.
	(selectedClass notNil and: [ nautilus showInstance not ]) ifTrue: [ 
		selectedClass := selectedClass theMetaClass ].
	^ selectedClass