configuration
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: self title)
		parent: #Tools;
		icon: (self environment
			at: #OBPolymorphInterface 
			ifPresent: [ :class | class default iconNamed: #seasideAdaptorRunning ]);
		action: [ self open ]