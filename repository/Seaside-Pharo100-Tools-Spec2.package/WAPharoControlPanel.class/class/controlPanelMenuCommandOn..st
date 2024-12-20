world menu
controlPanelMenuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #ServerAdapterBrowser)
		order: 1;
		parent: #Seaside;
		label: 'Seaside Control Panel';
		icon: (self iconNamed: #adaptorRunningIcon);
		action: [ self open ]