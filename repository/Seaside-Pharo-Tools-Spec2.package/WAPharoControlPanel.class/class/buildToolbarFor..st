commands
buildToolbarFor: presenter
	^ (CmCommandGroup named: 'Toolbar') asSpecGroup
		register: (WAStartAdaptorCommand forSpecContext: presenter);
		register: (WAStopAdaptorCommand forSpecContext: presenter);
		register: (WAInspectAdaptorCommand forSpecContext: presenter);
		register: (WAOpenBrowserCommand forSpecContext: presenter);
		yourself