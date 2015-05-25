rendering
renderCallbackOn: canvas
	self
		renderInline: [ :html | 
			html button
				callback: [  ];
				with: '' ]
		key: #callback
		on: canvas