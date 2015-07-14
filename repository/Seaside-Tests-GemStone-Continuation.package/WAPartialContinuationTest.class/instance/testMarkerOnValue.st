testing
testMarkerOnValue
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
	"Make sure the marker method is not included in the continuation and the continuation returns directly
	into the marker method."
	self assert: (result := self mark: [ kk value: 123. 456 ]) = 123.
	"known bug ... setting variables rooted in home context when intervening contexts are spliced out 
	 by partial continustaions, doesn't work"
	false 
		ifTrue: [
			self deny: captured.
			self assert: seen ].