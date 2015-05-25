visiting
visitClassListAttribute: anAttribute
	| options value selected |
	options := anAttribute options asArray.
	value := self configuration at: anAttribute key.
	(value notNil and: [ (options includes: value) not ])
		ifFalse: [ options := (Array with: value), (options) ].
	selected := value isNil ifTrue: [ nil ] ifFalse: [ value class ].
	self html select
		list: options;
		selected: selected;
		labels: [ :each | anAttribute stringForValue: each ];
		callback: [ :each | self configuration takeValue: each new forAttribute: anAttribute ]