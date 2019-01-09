*seaside-gemstone-core
seasideLogServerStart: label port: port

	self doTransaction: [
		(ObjectLogEntry
			info: label
			object:
				'pid: ', (System gemVersionReport at: 'processId') printString, ' ',
				'port: ', port printString) addToLog ]