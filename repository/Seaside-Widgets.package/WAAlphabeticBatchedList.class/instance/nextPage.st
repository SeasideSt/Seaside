actions
nextPage
	self isOnLastPage
		ifFalse: [ currentPage := self validPages after: currentPage ]