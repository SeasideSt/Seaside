actions
toggleUIProcess
	| uiProcess |
	uiProcess := self uiProcess.
	uiProcess isSuspended
		ifTrue: [ uiProcess resume ]
		ifFalse: [ uiProcess suspend ]