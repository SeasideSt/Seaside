private
strategyFor: aRequestContext
	^ (self isFromCrawler: aRequestContext)
		ifTrue: [ ipStrategy ]
		ifFalse: [ cookieStrategy ]