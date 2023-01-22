initialization
initializePresenter

	adaptors 
		transmitTo: infos 
		transform: [ :adaptor | adaptor ifNil: [ '' ] ifNotNil: [ :a | a controlPanelInfos ] ].

	self updateAdaptorsTable