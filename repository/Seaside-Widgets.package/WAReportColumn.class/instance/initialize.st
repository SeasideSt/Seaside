initialization
initialize
	super initialize.
	formatBlock := [ :x | x greaseString ].
	sortBlock := [ :a :b | a <= b ].
	valueBlock := [ :row | nil ].
	clickBlock := nil.
	title := 'Untitled'.
	hasTotal := false