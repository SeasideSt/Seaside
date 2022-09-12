parsing-internal
createCodePointFromSurrogatesHigh: aHighInteger low: aLowInteger
	^ 16r10000 + ((aHighInteger - 16rD800 bitShift: 10) bitOr: (aLowInteger - 16rDC00))