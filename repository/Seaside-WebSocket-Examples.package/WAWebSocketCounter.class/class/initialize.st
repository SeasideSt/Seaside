class initialization
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'examples/websockets/counter'.
	application addLibrary: JQDeploymentLibrary