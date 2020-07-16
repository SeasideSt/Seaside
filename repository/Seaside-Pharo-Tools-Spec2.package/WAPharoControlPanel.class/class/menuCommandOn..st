world menu
menuCommandOn: aBuilder
	<worldMenu>
	self registerIcons. 
	(aBuilder item: #ServerAdapterBrowser)
		order: 0.21;
		parent: #Tools;
		label: 'Seaside Control Panel';
		icon: (self iconNamed: #adaptorRunningIcon);
		action: [ self open ]