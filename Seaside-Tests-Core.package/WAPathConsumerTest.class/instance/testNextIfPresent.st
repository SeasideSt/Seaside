tests
testNextIfPresent
	| evaluated |
	evaluated := false.
	consumer nextIfPresentDo: [ :next |
		 self assert: next = 'tweets'.
		evaluated := true ].
	self assert: evaluated.
	
	evaluated := false.
	consumer nextIfPresentDo: [ :next |
		 self assert: next = 'kentbeck'.
		evaluated := true ].
	self assert: evaluated.
	
	evaluated := false.
	consumer nextIfPresentDo: [ :next |
		evaluated := true ].
	self deny: evaluated