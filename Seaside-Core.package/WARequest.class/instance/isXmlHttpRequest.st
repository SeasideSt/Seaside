testing
isXmlHttpRequest
	^ (self headerAt: 'x-requested-with') = 'XMLHttpRequest'