initialization
initializePresenter

	self initializeAdaptors.
	
	textModel aboutToStyle: false.
	
	listModel 
		whenSelectedItemChanged: [ :selection | adaptor := selection. self updateUIState ];
		whenListChanged: [ self updateUIState ];
		displayBlock: [ :item | (item class name,' ',item statusString) asStringMorph ];
		icons: [ :item | self iconForAdaptor: item ].
	(Smalltalk globals hasClassNamed: 'FastTableModel') ifFalse: [
		"only needed for NewListModel"
		listModel iconMaxSize: 16@16;
				menu: [ :aMenu | self adaptorsMenu: aMenu ]] ifTrue: [ 
		listModel menu: [ self adaptorsMenuMorph ]].

	self focusOrder
		add: listModel;
		add: toolbarModel;
		add: textModel.
	
	self disableAllButtons