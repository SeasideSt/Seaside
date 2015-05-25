building
buildDispatcherTreeWith: builder

	^  builder pluggableTreeSpec new
		model: self ;
		roots: #rootHandlers ;
		hasChildren: #isDispatcher: ;
		getChildren: #handlersOfDispatcher: ;
		setSelected: #handler: ;
		getSelected: #handler ;
		label: #handlerNameOf: ;
		menu: #handlerMenu: ;
		autoDeselect: false.
