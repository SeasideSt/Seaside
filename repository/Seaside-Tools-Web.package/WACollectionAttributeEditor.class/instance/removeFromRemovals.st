actions
removeFromRemovals
	self expression removals: (self 
		removeAll: self selectedRemovals 
		from: self expression removals)