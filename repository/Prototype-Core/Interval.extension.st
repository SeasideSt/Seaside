Extension { #name : 'Interval' }

{ #category : '*Prototype-Core' }
Interval >> javascriptOn: aRenderer [
	(aRenderer function: '$R')
		with: [
			"$R(first$, last$)"
			aRenderer argument: self first, '$'.
			aRenderer argument: self last, '$' ]
]
