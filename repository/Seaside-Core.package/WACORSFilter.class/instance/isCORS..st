testing
isCORS: aRequest

	^ (aRequest headerAt: 'origin') notNil