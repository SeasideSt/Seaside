rendering
renderContentOn: html
	html paragraph class: 'actions'; with: [
		#( bounce highlight pulsate shake size transfer ) do: [ :each | 
			html anchor
				onClick: (self
					perform: each asMutator
					with: (html jQuery: '.box') effect);
				with: each ] ].
	self renderBoxOn: html