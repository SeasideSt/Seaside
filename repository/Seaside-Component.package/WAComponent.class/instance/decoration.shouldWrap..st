decorations
decoration: oldDecoration shouldWrap: newDecoration
	^ (oldDecoration isGlobal and: [ newDecoration isGlobal not ])
		or: [ oldDecoration isDelegation and: [ newDecoration isLocal ] ]