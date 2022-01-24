commands
buildToolbarFor: presenter
	^ (CmCommandGroup named: 'Toolbar') asSpecGroup
		register: (WAAddAdaptorCommand forSpecContext: presenter);
		register: (WAStartAdaptorCommand forSpecContext: presenter);
		register: (WAStopAdaptorCommand forSpecContext: presenter);
		register: (WAInspectAdaptorCommand forSpecContext: presenter);
		register: (WAOpenBrowserCommand forSpecContext: presenter);
		yourself