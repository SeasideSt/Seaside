public
profile: aBlock
	profmonitor := ProfMonitor new.
	profmonitor startMonitoring.
	[ aBlock value ]
		ensure: [  profmonitor stopMonitoring; gatherResults; removeFile.  ]