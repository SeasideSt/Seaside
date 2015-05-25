convenience-status
refreshAfter: aDuration location: aUrl 
	self 
		headerAt: 'Refresh'
		put: aDuration asSeconds greaseString , '; ' , aUrl greaseString