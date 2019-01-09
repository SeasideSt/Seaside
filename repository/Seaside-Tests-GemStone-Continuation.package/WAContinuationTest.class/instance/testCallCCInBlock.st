tests
testCallCCInBlock
	| block kk captured seen result res  |
	captured := false.
	seen := false.
	block := [ | value |
		value := self callcc: [ :cc | kk := cc. captured := true ].
		seen := true.
		value ].

	(res := block value) == true
		ifTrue: [ 
			"first time through"
			self assert: captured.
			self assert: seen ].
	res = 123 
		ifTrue: [ 
			"second time through"
			self deny: captured.
			self assert: seen.
			^self ].
	captured := false.
	seen := false.
	self assert: (result := kk value: 123) = 123.
	"never get here"
	self assert: false