rendering
renderContentOn: html
	
	| input |
	
	html paragraph: 'A websocket is setup with a turbostream on this page. Click the buttons to append, preprend or replace the text in the paragraph below'.

	html render: (WAWebSocketTurboStreamSource new pusher: self pusher).
	
	html basicForm: [
		html textInput
			callback: [ :value | input := value ];
			placeholder: 'Enter some text'.
		html button
			onClick: (html jQuery ajax serializeForm; callback: [ self pusher turboStream: [ :ts | ts append: #text with: input ] ]);
			with: 'Append'.
		html button
			onClick: (html jQuery ajax serializeForm; callback: [ self pusher turboStream: [ :ts | ts prepend: #text with: input ] ]);
			with: 'Prepend'.
		html button
			onClick: (html jQuery ajax serializeForm; callback: [ self pusher turboStream: [ :ts | ts replace: #text with: [:inner | inner paragraph id: #text ] ] ]);
			with: 'Replace'  ].
	
	html paragraph 
		id: #text;
		with: 'Turbostreams are awesome over websockets.'