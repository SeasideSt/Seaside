rendering
renderContentOn: html
	self actions do: [ :symbol |
		symbol numArgs = 0
			ifTrue: [ self renderLink: symbol on: html ]
			ifFalse: [ self renderInput: symbol on: html ] ]