testing
testGemStoneMarkerOnValue
	| kk captured result |
	captured := false.
	gsSeen := false.
	self	shouldnt: [
			self markDiscardingResultOf: [ | value |
				value := self callcc: [ :cc | kk := cc. captured := true ].
				gsSeen := true.
				value ] ]
		raise: Error.
	self assert: captured.
	self assert: gsSeen.
	captured := false.
	gsSeen := false.
	"Make sure the marker method is not included in the continuation and the continuation returns directly
	into the marker method."
	self assert: (result := self mark: [ kk value: 123. 456 ]) = 123.
	self assert: gsSeen