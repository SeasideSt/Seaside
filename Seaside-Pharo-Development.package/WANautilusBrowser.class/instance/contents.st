accessing
contents
	^ nautilus showComment
		ifTrue: [ 
			self selectedClass isNil
				ifTrue: [ '' ]
				ifFalse: [
					"class comment"
					nautilus selectedClass organization comment ] ]
		ifFalse: [ 
			nautilus selectedMethod isNil
				ifTrue: [
					self selectedClass isNil
						ifTrue: [ '' ]
						ifFalse: [
							selectedMessageCategory isNil
								ifTrue: [
									"class definition"
									self selectedClass definition ]
								ifFalse: [
									"method template"
									self selectedClass sourceCodeTemplate ] ] ]
				ifFalse: [
					"method source code"
					nautilus selectedMethod sourceCode ] ]