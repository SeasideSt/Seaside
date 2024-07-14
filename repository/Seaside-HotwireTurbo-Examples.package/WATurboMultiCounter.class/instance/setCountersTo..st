actions
setCountersTo: aValue

	| theValue |
	theValue := Integer readFrom: aValue ifFail: [ 0 ].
	counters do: [ :each | each counter: theValue ]