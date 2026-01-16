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
			((SpStringTableColumn
				title: 'Kind'
				evaluated: [ :adaptor | adaptor class ])
				width: 180;
				yourself);
		addColumn:
			((SpStringTableColumn
				title: 'Port'
				evaluated: [ :adaptor | adaptor port ])
				width: 50;
				yourself
				);
		addColumn:
			((SpStringTableColumn
				title: 'Status'
				evaluated: [ :adaptor | 
					adaptor isRunning
						ifTrue: [ 'Running' ]
						ifFalse: [ 'Stopped' ] ])
					width: 55;
					yourself);
		addColumn:
			(SpStringTableColumn
				title: 'Serve static files from:'
				evaluated: [ :adaptor | 

					(adaptor species = ZnZincStaticServerAdaptor)
					 ifTrue: [ adaptor server delegate wwwRootDirectory ]
					 ifFalse: [ 'Not serving static contents'] ]);			
					
		contextMenu: [ (self rootCommandsGroup / 'Table menu') beRoot asMenuPresenter ].
	infos disable