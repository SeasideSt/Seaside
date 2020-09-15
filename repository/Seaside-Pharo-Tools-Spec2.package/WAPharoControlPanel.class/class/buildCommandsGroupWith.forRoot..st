commands
buildCommandsGroupWith: presenter forRoot: aGroup
	aGroup
		register: (self buildTableMenuFor: presenter);
		register: (self buildToolbarFor: presenter)