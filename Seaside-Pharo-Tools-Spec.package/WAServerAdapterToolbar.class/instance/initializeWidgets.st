initialization
initializeWidgets

	self instantiateModels: #(
		startButton ButtonModel
		stopButton ButtonModel
		browseButton ButtonModel).
	
	self registerStartButtonEvents.
	self registerStopButtonEvents.
	self registerBrowseButtonEvents.
	
	self focusOrder 
		add: startButton;
		add: stopButton;
		add: browseButton.
	