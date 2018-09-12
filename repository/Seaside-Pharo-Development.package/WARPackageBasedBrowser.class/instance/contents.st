accessing
contents
	^ showComment
		ifTrue: [ 
			self selectedClass isNil
				ifTrue: [ '' ]
				ifFalse: [
					"class comment"
					selectedClass organization comment ] ]
		ifFalse: [ 
			selectedMethod isNil
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
					selectedMethod sourceCode ] ]