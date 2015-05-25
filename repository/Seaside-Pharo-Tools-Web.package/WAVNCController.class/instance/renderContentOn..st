rendering
renderContentOn: html
	html heading: 'VNC Server'.
	self isServerRunning
		ifTrue: [ self renderStopOn: html ]
		ifFalse: [ self renderStartOn: html ].
	html heading: 'UI Process'.
	self uiProcess isSuspended
		ifFalse: [ self renderSuspendOn: html ]
		ifTrue: [ self renderResumeOn: html ]