*Seaside-GemStone-Core
restoreFromSnapshot: aDictionary
	self keys do: [ :key | self removeKey: key ].
	aDictionary keysAndValuesDo: [ :key :value | self at: key put: value ]