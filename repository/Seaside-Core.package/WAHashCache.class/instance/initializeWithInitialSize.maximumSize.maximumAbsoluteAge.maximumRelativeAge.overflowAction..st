initialization
initializeWithInitialSize: aSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol
	super initializeWithInitialSize: aSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol.
	size := 0.
	keyTable := Array new: aSizeInteger