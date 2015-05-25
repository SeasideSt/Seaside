scripting
scriptHide: anElement on: aScript
	| index |
	index := self findIndex: anElement ifAbsent: [ ^ self ].
	aScript scriptaculous effect
		id: (self uid: 'body' at: index);
		onAfterFinish: (PTElement new
						id: (self uid: 'body' at: index); 
						remove);
		duration: 0.2;
		blindUp.
	aScript prototype element
		id: (self uid: 'head' at: index);
		removeClassName: 'active'
		
	
