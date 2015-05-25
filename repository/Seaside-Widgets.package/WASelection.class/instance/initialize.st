initialization
initialize
	super initialize.
	items := #().
	labelBlock := [ :each | each greaseString ]