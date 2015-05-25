rendering
renderContentOn: html
	html paragraph class: 'actions'; with: [
		#( blind clip drop explode fade fold puff scale slide ) do: [ :each | 
			html anchor
				onClick: ((html jQuery: '.box') effect
					toggle;
					perform: each);
				with: each ] ].
	self renderBoxOn: html