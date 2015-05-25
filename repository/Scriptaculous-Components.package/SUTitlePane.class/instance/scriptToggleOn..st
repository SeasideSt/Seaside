scripting
scriptToggleOn: script
	open
		ifTrue: [ 
			(script scriptaculous effect)
				id: uid;
				duration: 0.3;
				blindUp.
			(script prototype element)
				id: 'gfx' , uid;
				removeClassName: 'gfxopen';
				addClassName: 'gfx' ]
		ifFalse: [ 
			(loaded not or: [ alwaysRefresh ])
				ifTrue: [ 
					(script prototype element)
						id: uid;
						update: body.
					loaded := true ].
			(script prototype element)
				id: uid;
				removeClassName: 'closed'.
			(script prototype element)
				id: 'gfx' , uid;
				removeClassName: 'gfx';
				addClassName: 'gfxopen'.
			(script scriptaculous effect)
				id: uid;
				duration: 0.3;
				blindDown ].
	open := open not