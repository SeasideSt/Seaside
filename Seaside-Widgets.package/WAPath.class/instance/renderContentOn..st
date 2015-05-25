rendering
renderContentOn: html
	stack isEmpty 
		ifTrue: [ ^ self ].
	html div class: 'path'; with: [
		stack allButLast do: [ :assoc |
			html anchor 
				callback: [ self choose: assoc ]; 
				with: assoc key.
			html text: ' >> ' ].
		html strong: stack last key ]