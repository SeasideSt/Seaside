testing
testNoMarkerOnValue
	| kk captured seen result |
	captured := false.
	seen := false.
	self	shouldnt: [
			self markDiscardingResultOf: [ | value |
				value := self callcc: [ :cc | kk := cc. captured := true ].
				seen := true.
				value ] ]
		raise: Error.
		
	self assert: captured.
	self assert: seen.
	true ifTrue: [ ^self ]. "avoid stomping on contexts"
	captured := false.
	seen := false.
	"Make sure the marker method was not included in the continuation"
	self assert: (result := kk value: 123) = 123.
	"known bug ... setting variables rooted in home context when intervening contexts are spliced out 
	 by partial continustaions, doesn't work"
	false 
		ifTrue: [
			self deny: captured.
			self assert: seen ].