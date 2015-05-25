ancestry
ancestors
	"As it happens, the 'seen' set gives us the result we need"
	| set |
	set := IdentitySet new.
	self 
		ancestorsDo:  [ :each | "nothing" ]
		seen: set.
	^ set