rendering
renderContentOn: html
	
	html listItem
		onDoubleClick: (html javascript callback: [ self call: (WATodoItemEditor on: self) ]);
		with:[ 
			html form
				class: 'view';
				with:[
					html checkbox
						class: 'toggle';
						onChange: (html javascript: 'this.form.requestSubmit()');
						callback: [ :value | self done: value ];
						value: done.
					html label: description.
					html button
						callback: [ self remove ];
						class: 'destroy' ] ]