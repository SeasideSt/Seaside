rendering-chat
renderChatInputOn: html
	html form
		onSubmit: (html jQuery ajax
			onSuccess: ((html jQuery: #input) 
				value: String new;
				triggerFocus);
			serializeForm;
			return: false);
		with: [
			html textInput
				id: #input;
				callback: [ :value | self message: value ] ]