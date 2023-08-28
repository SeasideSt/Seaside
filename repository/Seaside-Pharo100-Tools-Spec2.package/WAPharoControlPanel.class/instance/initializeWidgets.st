initialization
initializeWidgets
	adaptors := self newTable.
	actionBar := SpToolbarPresenterBuilder new
		visit: (self rootCommandsGroup / 'Toolbar'); 
		toolbarPresenter.
	infos := self newText.
	adaptors
		addColumn:
			((SpImageTableColumn
				title: ''
				evaluated: [ :adaptor | self iconForAdaptor: adaptor ])
				width: 25;
				yourself);
		addColumn:
			(SpStringTableColumn
				title: 'Kind'
				evaluated: [ :adaptor | adaptor class ]);
		addColumn:
			(SpStringTableColumn
				title: 'Port'
				evaluated: [ :adaptor | adaptor port ]);
		addColumn:
			(SpStringTableColumn
				title: 'Status'
				evaluated: [ :adaptor | 
					adaptor isRunning
						ifTrue: [ 'Running' ]
						ifFalse: [ 'Stopped' ] ]);
		contextMenu: [ (self rootCommandsGroup / 'Table menu') beRoot asMenuPresenter ].
	infos disable