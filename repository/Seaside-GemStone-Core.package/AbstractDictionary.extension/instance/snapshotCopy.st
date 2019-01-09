*Seaside-GemStone-Core
snapshotCopy
	| n |
	n := self class new: self tableSize.
	self keysAndValuesDo: [:k :v | n at: k put: v].
	^n