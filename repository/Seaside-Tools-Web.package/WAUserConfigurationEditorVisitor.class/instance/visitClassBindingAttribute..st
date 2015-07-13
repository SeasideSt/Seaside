visiting
visitClassBindingAttribute: anAttribute
	| options binding selected |
	options := anAttribute options asArray.
	binding := self configuration at: anAttribute key.
	(binding notNil and: [ (options includes: binding value) not ])
		ifTrue: [ options := (Array with: binding value), (options) ].
	selected := binding isNil ifTrue: [ nil ] ifFalse: [ binding value ].
	self html select
		list: options;
		selected: selected;
		labels: [ :each | anAttribute stringForValue: each ];
		callback: [ :each |
			self configuration
				takeValue: (GRPlatform current bindingOf: each)
				forAttribute: anAttribute ]