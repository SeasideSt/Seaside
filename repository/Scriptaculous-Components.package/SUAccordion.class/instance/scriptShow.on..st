scripting
scriptShow: anElement on: aScript
	| index |
	index := self findIndex: anElement ifAbsent: [ ^ self ].
	aScript prototype element
		id: (self uid: 'head' at: index);
		insertAfter: [ :html | 
			self 
				renderBody: anElement index: index
				visible: false on: html ].
	aScript scriptaculous effect
		id: (self uid: 'body' at: index);
		duration: 0.2;
		blindDown.
	aScript prototype element
		id: (self uid: 'head' at: index);
		addClassName: 'active'