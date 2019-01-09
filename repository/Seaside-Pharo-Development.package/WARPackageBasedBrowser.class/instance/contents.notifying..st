accessing
contents: input notifying: aController
	^ showComment
		ifTrue: [
			selectedClass organization comment: input.
			true ]
		ifFalse: [
			(self selectedMessageName isNil and: [ selectedMessageCategory isNil ])
				ifTrue: [
					"compile a class"
					selectedClass subclassDefinerClass
						evaluate: input
						notifying: aController
						logged: true ]
				ifFalse: [
					"compile a method"
					 (self selectedClass
						compile: input
						classified: self protocolForSelectedMethod
						notifying: aController) isSymbol ] ]