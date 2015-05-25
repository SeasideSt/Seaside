accessing
columnClickBlock: aBlock
	self clickBlock: [ :r | aBlock value: (self valueForRow: r) ]