accessing
adaptorsMenu: aMenu 
	^ aMenu
		addGroup: [ :group | 
			group addItem: [ :item |				 
				item 
					name: 'Add adaptor...';					
					action: [ self addAdaptor ] ].
			group addItem: [ :item |
				item 
					name: 'Remove adaptor';
					enabled: [ self hasSelectedAdaptor ];	
					action: [ self removeAdaptor: self listModel selectedItem ] ] ];
		addGroup: [ :group | 
			group addItem: [ :item |
				item 
					name: 'Set adaptor encoding...';
					enabled: [ self hasSelectedAdaptor ];	
					action: [ self setEncodingFor: self listModel selectedItem ] ] ];
		addGroup: [ :group | 
			group addItem: [ :item |
				item 
					name: 'Clear configuration caches';
					action: [ self clearConfigurationCaches ] ].
			group addItem: [ :item |
				item 
					name: 'Clear sessions';
					action: [ self clearSessions ] ] ].