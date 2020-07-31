commands
buildTableMenuFor: presenter
	^ (CmCommandGroup named: 'Table menu') asSpecGroup
		register:
			((CmCommandGroup named: 'Addition and removal') asSpecGroup
				beDisplayedAsGroup;
				register: (WAAddAdaptorCommand forSpecContext: presenter);
				register: (WARemoveAdaptorCommand forSpecContext: presenter);
				yourself);
		register:
			((CmCommandGroup named: 'Encoding') asSpecGroup
				beDisplayedAsGroup;
				register: (WASetAdaptorEncodingCommand forSpecContext: presenter);
				yourself);
		register:
			((CmCommandGroup named: 'Clearing') asSpecGroup
				beDisplayedAsGroup;
				register: (WAClearConfigurationCachesCommand forSpecContext: presenter);
				register: (WAClearSessionsCommand forSpecContext: presenter);
				yourself);
		yourself