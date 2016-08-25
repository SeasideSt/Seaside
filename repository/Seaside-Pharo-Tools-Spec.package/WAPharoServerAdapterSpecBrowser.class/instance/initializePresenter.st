initialization
initializePresenter

	self initializeAdaptors.
	
	textModel aboutToStyle: false.
	
	listModel 
		whenSelectedItemChanged: [ :selection | adaptor := selection. self updateUIState ];
		whenListChanged: [ self updateUIState ];
		displayBlock: [ :item | (item class name,' ',item statusString) asStringMorph ];
		icons: [ :item | self iconForAdaptor: item ];
		menu: [ :aMenu | self adaptorsMenu: aMenu ].
	(Smalltalk globals hasClassNamed: 'FastTableModel') ifFalse: [
		"only needed for NewListModel"
		listModel iconMaxSize: 16@16 ].

	self focusOrder
		add: listModel;
		add: toolbarModel;
		add: textModel.
	
	self disableAllButtons