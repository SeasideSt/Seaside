rendering
renderValuesOn: html
	
	self renderLabel: 'Uptime' value: (self printDuration: self upTime) on: html.
	self renderLabel: 'Version' value: self version on: html.
	self renderLabel: 'Image Path' value: (self image vm getSystemAttribute: 1) on: html.
	self
		renderLabel: 'Number of Sessions'
		value: [
			html text:self numberOfSessions.
			html space.
			html anchor
				callback: [ self clear. self requestContext redirectTo: self application url ];
				title: 'Expires all sessions and does a full garbage collect.';
				with: 'Clear' ]
		on: html.
	self renderLabel: 'Number of Classes' value: Smalltalk allClasses size on: html