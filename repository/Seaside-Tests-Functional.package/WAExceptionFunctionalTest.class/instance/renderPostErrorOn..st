rendering
renderPostErrorOn: html 
	html heading: 'POST Error'.
	html paragraph: 'Behaviour should be like ''Error''.'.
	html form
		post;
		with: [
			html button
				callback: [ self raiseError ];
			with: 'Raise error' ]