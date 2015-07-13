accessing
cache: aCache
	self greaseDeprecatedApi: 'WASession>>#cache:' details: 'Use #documentHandlers: instead'.
	self documentHandlers: aCache