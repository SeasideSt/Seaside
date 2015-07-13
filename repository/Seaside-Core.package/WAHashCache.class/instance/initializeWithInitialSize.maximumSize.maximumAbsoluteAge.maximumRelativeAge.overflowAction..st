initialization
initializeWithInitialSize: anSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol
	self initialize.
	size := 0.
	keyTable := Array new: anSizeInteger.
	valueTable := Array new: anSizeInteger.
	maximumSize := aMaximumSizeInteger.
	maximumAbsoluteAge := aMaximumAbsoluteAge.
	maximumRelativeAge := aMaximumRelativeAge.
	overflowAction := aOverflowActionSymbol