actions
deleteLogEntriesUpToInclusive: anObjectLogEntry

	| entries index log |
	entries := report rows.
	index := entries indexOf: anObjectLogEntry.
	log := self objectLogEntries: true.
	(entries copyFrom: 1 to: index) do: [:ea |
		 log remove: ea ifAbsent: []].