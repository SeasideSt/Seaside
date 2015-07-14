private
pluginsDo: aBlock
	aBlock value: self expiryPolicy.
	aBlock value: self reapingStrategy.
	aBlock value: self missStrategy.
	aBlock value: self removalAction