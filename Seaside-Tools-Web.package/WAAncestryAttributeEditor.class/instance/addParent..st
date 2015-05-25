actions
addParent: aParent 
	aParent isNil ifFalse: [
		self configuration addParent: aParent.
		(aParent isKindOf: WAAuthConfiguration) ifTrue: [
			self myApplication 
				preferenceAt: #login put: 'admin';
				preferenceAt: #passwordHash	put: (GRPlatform current secureHashFor: 'seaside');
				addFilter: WAAuthenticationFilter new ].
		self parent buildGroups.
		selectedConfiguration contents: aParent ]