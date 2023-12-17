tests
testDo
	| buffer collector |
	buffer := ZnRingBuffer new: 5.
	buffer
		at: 1 put: 1;
		at: 5 put: 2.
	collector := OrderedCollection new.
	buffer do: [ :value | collector add: value ].
	self assert: collector asArray equals: #(1 nil nil nil 2).
	
	buffer moveStartTo: 2.
	collector := OrderedCollection new.
	buffer do: [ :value | collector add: value ].
	self assert: collector asArray equals: #(nil nil nil 2 1)