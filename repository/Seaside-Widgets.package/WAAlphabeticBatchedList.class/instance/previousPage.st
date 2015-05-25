actions
previousPage
	self isOnFirstPage
		ifFalse: [ currentPage := self validPages before: currentPage ]