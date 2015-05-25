private
basicStart
	process := [ [ self listenLoop ] repeat ] newProcess.
	process priority: Processor userBackgroundPriority.
	process name: 'seaside-' , self port printString.
	process resume