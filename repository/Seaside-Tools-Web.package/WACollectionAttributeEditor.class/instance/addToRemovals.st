actions
addToRemovals
	self expression removals: self expression removals , (self selectedInherited 
		reject: [ :each | self expression removals includes: each ])