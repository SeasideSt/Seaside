accessing
forwardedFor
	"Returns the value of the first occurrence of the For directive in a forwarded header, if it exists. Returns nil otherwise."
	| startOfFirstForDirective endOfFirstForDirective |
	^ self forwarded ifNotNil:[ :forwarded | 
		startOfFirstForDirective := forwarded indexOfSubCollection:'for=' startingAt: 1.
		startOfFirstForDirective = 0 ifTrue:[ startOfFirstForDirective := forwarded indexOfSubCollection:'For=' startingAt: 1 ].
		startOfFirstForDirective ~= 0
			ifTrue:[ 
				endOfFirstForDirective := (forwarded indexOfAnyOf: ';,' startingAt: startOfFirstForDirective) - 1.
				endOfFirstForDirective = -1 ifTrue:[ endOfFirstForDirective := forwarded size ].
				forwarded copyFrom: startOfFirstForDirective + 4 to: endOfFirstForDirective ]
			ifFalse: [ nil ] ]