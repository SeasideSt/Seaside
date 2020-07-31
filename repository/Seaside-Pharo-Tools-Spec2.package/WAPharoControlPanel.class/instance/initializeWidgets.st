initialization
initializeWidgets
	adaptors := self newTable.
	actionBar := (self rootCommandsGroup / 'Toolbar') asToolbarPresenter.
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