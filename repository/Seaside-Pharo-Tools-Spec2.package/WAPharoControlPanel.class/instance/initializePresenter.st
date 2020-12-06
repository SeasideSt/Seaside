initialization
initializePresenter
	adaptors transmitTo: infos transform: [ :adaptor | adaptor ifNotNil:[ :a | a controlPanelInfos ] ].

	self updateAdaptorsTable