rendering
renderValuesOn: html
	| upTime |
	upTime := Duration milliseconds: Time millisecondClockValue.
	
	self renderLabel: 'Uptime' value: (self printDuration: upTime) on: html.
	self renderLabel: 'Version' value: Smalltalk version on: html.
	self renderLabel: 'Image Path' value: (self image vm getSystemAttribute: 1) on: html.
	self
		renderLabel: 'Number of Sessions'
		value: [
			html text:self numberOfSessions.
			html space.
			html anchor
				callback: [ self clear ];
				title: 'Expires all sessions and does a full garbage collect.';
				with: 'Clear' ]
		on: html.
	self renderLabel: 'Number of Classes' value: Smalltalk size on: html.