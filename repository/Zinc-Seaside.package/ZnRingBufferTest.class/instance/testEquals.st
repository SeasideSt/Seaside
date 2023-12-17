tests
testEquals
	"We use #= on purpose in this test because the test
	only works one way."
	| buffer |
	buffer := ZnRingBuffer new: 3.
	self assert: buffer = #(nil nil nil).
	
	buffer
		at: 1
		put: 1.
	self assert: buffer = #(1 nil nil).
	
	buffer moveStartTo: 2.
	self assert: buffer = #(nil nil 1)