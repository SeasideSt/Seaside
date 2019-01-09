building
iconForIndex: anIndex

	| adaptor |
	adaptor := self adaptorAt: anIndex ifAbsent: [^ nil].
	adaptor isRunning ifTrue: [^self class seasideAdaptorRunningIcon].
	adaptor isStopped ifTrue: [^self class seasideAdaptorStoppedIcon].
	^ MenuIcons blankIconOfWidth: 12