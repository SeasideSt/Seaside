initialization
initializeWidgets

	self instantiateModels: #(
		startButton ButtonModel
		stopButton ButtonModel
		browseButton ButtonModel
		openButton ButtonModel).
	
	self registerStartButtonEvents.
	self registerStopButtonEvents.
	self registerBrowseButtonEvents.
	self registerOpenButtonEvents.	

	self focusOrder 
		add: startButton;
		add: stopButton;
		add: browseButton;
		add: openButton
	