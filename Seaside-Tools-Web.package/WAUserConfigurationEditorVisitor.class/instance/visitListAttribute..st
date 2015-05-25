visiting
visitListAttribute: anAttribute
	| options value |
	options := anAttribute options asArray.
	value := self configuration at: anAttribute key.
	(value isNil or: [ options includes: value ])
		ifFalse: [ options := (Array with: value) , (options) ].
	self html select
		beOptional;
		list: options;
		selected: value;
		optionalLabel: '(none)';
		labels: [ :each | anAttribute stringForValue: each ];
		callback: [ :each | self configuration takeValue: each forAttribute: anAttribute ]