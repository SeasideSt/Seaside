rendering
renderList: aCollection level: anInteger on: html
	| id selected |
	aCollection isEmpty ifTrue: [ ^ self ].
	html select
		beOptional;
		list: aCollection;
		labels: labelBlock;
		id: (id := html nextId);
		optionalLabel: '(select)';
		selected: (selected := selectionPath
			at: anInteger
			ifAbsent: [ nil ]);
		callback: [ :value |
			[ selectionPath size < anInteger ]
		 		whileFalse: [ selectionPath removeLast ].
			selectionPath addLast: value ];
		onChange: (html scriptaculous updater
			id: uid;
			triggerFormElement: id;
			callback: [ :r | self renderListOn: r ]).
	selected isNil
		ifFalse: [ self renderList: (childrenBlock value: selected) level: anInteger + 1 on: html ]