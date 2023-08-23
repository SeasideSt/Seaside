rendering
renderContentOn: html

	| id |
	html listItem
		onDoubleClick: (html javascript turboCallback: [ self turboCall: (WATurboTodoItemEditor on: self) ]);
		id: (id := html nextId);
		with: [ 
		html div
			class: 'view';
			with:[
				html form
					turboStreamCallback:[ :ts | ts update: id with: self ];
					with:[
						html checkbox
							class: 'toggle';
							callback: [ :value | self done: value ];
							onChange: (html javascript: 'this.form.requestSubmit()');
							value: done ].
				html label: description.
				html form: [
					html button
						class: 'destroy';
						turboStreamCallback: [ :ts | ts remove: self remove ] ] ] ] 