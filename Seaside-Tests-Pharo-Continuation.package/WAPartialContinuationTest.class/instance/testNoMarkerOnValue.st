tests
testNoMarkerOnValue
	| kk captured seen |
	captured := false.
	seen := false.
	self	shouldnt: [
			self markDiscardingResultOf: [
				| value |
				value := self callcc: [ :cc | kk := cc. captured := true ].
				seen := true.
				value ] ]
		raise: Error.
		
	self assert: captured.
	self assert: seen.
	captured := false.
	seen := false.
	"Make sure the marker method was not included in the continuation"
	self assert: (kk value: 123) = 123.
	self deny: captured.
	self assert: seen