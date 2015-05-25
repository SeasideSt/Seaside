accessing
addColumn: aBlock label: aString
	^ columns add: ((self treeReportColumnClass on: self)
		renderer: aBlock;
		label: aString;
		yourself)