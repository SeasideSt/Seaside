initialization
initializeOn: aHandler
	super initializeOn: aHandler.
	fileEditor := WAFileAttributeEditor new configuration: self handler libraries; handler: handler; group: #libraries; parent: self; yourself