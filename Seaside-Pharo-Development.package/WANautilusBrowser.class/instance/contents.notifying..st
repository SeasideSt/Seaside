accessing
contents: input notifying: aController
	^ nautilus showComment
		ifTrue: [
			nautilus selectedClass organization comment: input.
			true ]
		ifFalse: [
			selectedMessageCategory isNil
				ifTrue: [
					"compile a class"
					nautilus selectedClass subclassDefinerClass
						evaluate: input
						notifying: aController
						logged: true ]
				ifFalse: [
					"compile a method"
					 (self selectedClass
						compile: input
						classified: selectedMessageCategory
						notifying: aController) isSymbol ] ]