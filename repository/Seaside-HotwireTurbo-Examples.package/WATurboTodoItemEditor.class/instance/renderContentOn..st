rendering
renderContentOn: html

	html form: [
		html textInput
			class: 'edit';
			callback: [ :value | todoItem description: value ];
			value: todoItem description.
		html submitButton
			style: 'display:none';
			callback: [ self answer ] ]