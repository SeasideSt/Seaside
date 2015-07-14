testing
testGemStoneNoMarkerOnValue
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
	"Make sure the marker method was not included in the continuation"
	self assert: (result := kk value: 123) = 123.
	self deny: captured.
	self assert: gsSeen