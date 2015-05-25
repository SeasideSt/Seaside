*comet-pharo-core
cometForkProcessDo: aBlock
	^ aBlock forkAt: 20 named: 'ping'