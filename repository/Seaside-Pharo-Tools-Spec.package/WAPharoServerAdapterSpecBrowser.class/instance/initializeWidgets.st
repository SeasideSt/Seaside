initialization
initializeWidgets

	self instantiateModels:((Smalltalk globals hasClassNamed: 'FastTableModel')
		ifTrue: [ #(
			listModel FastTableModel
			textModel TextModel
			toolbarModel WAServerAdapterToolbar) ]
		ifFalse: [ #(
			listModel NewListModel
			textModel TextModel
			toolbarModel WAServerAdapterToolbar) ])