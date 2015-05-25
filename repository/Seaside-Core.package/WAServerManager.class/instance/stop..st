starting/stopping
stop: aServerAdaptor
	(self canStop: aServerAdaptor) ifTrue: [ aServerAdaptor basicStop ]