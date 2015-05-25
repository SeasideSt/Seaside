accessing
priority
	^ pathMatches inject: 0 into: [ :sum :each |
		sum + each priority ]