initialization
initializePresenter

	self initializeAdaptors.
	
	textModel aboutToStyle: false.
	
	listModel 
		whenSelectedItemChanged: [ :selection | adaptor := selection. self updateUIState];
		whenListChanged: [ self updateUIState];
		displayBlock: [ :item | (item class name,' ',item statusString) asStringMorph ];
		icons: [ :item | self iconForAdaptor: item];
		iconMaxSize: 16@16;
		menu: [ :aMenu | self adaptorsMenu: aMenu].

	self focusOrder
		add: listModel;
		add: toolbarModel;
		add: textModel.
	
	self disableAllButtons