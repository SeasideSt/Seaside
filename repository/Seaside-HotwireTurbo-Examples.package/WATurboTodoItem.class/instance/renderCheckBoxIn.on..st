rendering
renderCheckBoxIn: id on: html

	html form
		turboStreamCallback: [ :ts | ts update: id with: self ];
		with: [ 
			html checkbox
				class: 'toggle';
				callback: [ :value | self done: value ];
				onChange: (html javascript: 'this.form.requestSubmit()');
				value: done ]