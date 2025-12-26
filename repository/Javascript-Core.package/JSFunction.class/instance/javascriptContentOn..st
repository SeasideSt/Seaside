printing
javascriptContentOn: aRenderer
	aRenderer defineFunction
		arguments: self arguments;
		with: [ 
			statements isEmpty ifFalse: [
				self return
					ifTrue: [
						1 to: statements size - 1 do: [:index | 
							aRenderer render: (statements at: index).
							aRenderer document separator ].
						aRenderer return: statements last ]
					ifFalse: [
						statements
							do: [ :each | aRenderer render: each ]
							separatedBy: [ aRenderer document separator ] ] ] ]