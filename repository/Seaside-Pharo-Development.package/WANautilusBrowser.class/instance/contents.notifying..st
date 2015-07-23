accessing
contents: input notifying: aController
	^ nautilus showComment
		ifTrue: [
			nautilus selectedClass organization comment: input.
			true ]
		ifFalse: [
			self selectedMessageName isNil
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
						classified: self protocolForSelectedMethod
						notifying: aController) isSymbol ] ]