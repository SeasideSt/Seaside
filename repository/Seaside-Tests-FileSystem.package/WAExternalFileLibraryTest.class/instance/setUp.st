running
setUp
	super setUp.
	fileSystem := WAExternalFileLibrary new.
	WADispatcher new register: fileSystem at: 'culture'