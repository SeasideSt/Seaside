actions
deleteAllAtPriority: aSummaryEntry

	| priority log |
	priority := aSummaryEntry key.
	log := self objectLogEntries: true.
	(log select: [:ea | ea priority == priority ]) do: [:ea |  log remove: ea ifAbsent: []].