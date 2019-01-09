actions
deleteLogEntry: anObjectLogEntry

	|  log |
	log := self objectLogEntries: true.
	log remove: anObjectLogEntry ifAbsent: []