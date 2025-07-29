printing
javascriptContentOn: aRenderer
	aRenderer defineFunction
		arguments: self arguments;
		with: [ 
			statements isEmpty ifFalse: [
				self return
					ifTrue: [
						statements allButLastDo: [ :each |
							aRenderer render: each.
							aRenderer document separator ].
						aRenderer return: statements last ]
					ifFalse: [
						statements
							do: [ :each | aRenderer render: each ]
							separatedBy: [ aRenderer document separator ] ] ] ]