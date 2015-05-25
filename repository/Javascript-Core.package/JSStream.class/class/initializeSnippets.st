initialization
initializeSnippets
	This := self on: 'this'.
	Arguments := (0 to: 25)
		collect: [ :each | self on: 'arguments[' , each printString , ']' ]