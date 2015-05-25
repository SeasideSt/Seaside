starting/stopping
start: aServerAdaptor
	(self canStart: aServerAdaptor) ifTrue: [
		[ aServerAdaptor basicStart ]
			ifCurtailed: [ self stop: aServerAdaptor ] ]