rendering
renderContentOn: html
	html listItem
		passenger: self;
		with: [ 
			html div
				class: 'view';
				with:[
					html checkbox
						class: 'toggle';
						callback: [ :value | self done: value ];
						value: done.
					html label: description.
					html button
						class: 'destroy' ].
		html textInput
			class: 'edit';
			style: 'display:none';
			callback: [ :value | self description: value ];
			value: description ]