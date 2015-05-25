visiting
visitBooleanAttribute: anAttribute
	self html select
		list: (Array with: true with: false);
		selected: (self configuration at: anAttribute key);
		labels: [ :bool | anAttribute stringForValue: bool ];
		callback: [ :value | self configuration takeValue: value forAttribute: anAttribute ]