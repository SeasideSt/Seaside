*Comet-Core
cometForkProcessDo: aBlock
	^ aBlock forkAt: 20 named: 'ping'