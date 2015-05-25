tests
testComponentCreation
	| creator |
	creator := WAWelcomeComponentCreator new.
	creator createComponent: #WAWelcomeTestTemp.
	self assert: (Smalltalk globals includesKey: #WAWelcomeTestTemp)
	