rendering
renderActionsOn: html
	html
		paragraph: [ 
			html anchor
				url: (self application url with: self class name);
				with: 'New Session'.
			html break.
			html anchor
				callback: [ self session unregister. self redirect ];
				with: 'Expire'.
			html break.
			html anchor
				callback: [ WAExpirySession resetCounters ];
				with: 'Reset Counters'.
			html break.
			html anchor
				callback: [ GRPlatform current seasideGarbageCollect ];
				with: 'Garbage Collect'.
			html break.
			html anchor
				callback: [ 
					self application clear.
					GRPlatform current seasideGarbageCollect.
					self redirect ];
				with: 'Clear Cache'.
			html break.
			html anchor
				callback: [ 
					self application clear.
					WAExpirySession resetCounters.
					GRPlatform current seasideGarbageCollect.
					self redirect ];
				with: 'Reset All' ]