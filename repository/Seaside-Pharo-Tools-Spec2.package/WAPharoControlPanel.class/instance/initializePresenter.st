initialization
initializePresenter
	adaptors transmitTo: infos transform: [ :adaptor | adaptor controlPanelInfos ].

	self updateAdaptorsTable