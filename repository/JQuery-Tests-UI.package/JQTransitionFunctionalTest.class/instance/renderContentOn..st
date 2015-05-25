rendering
renderContentOn: html
	html paragraph class: 'actions'; with: [
		#( green wide bold ) do: [ :each |
			html anchor
				onClick: ((html jQuery: '.box')
					toggleClass: each
					duration: 'slow');
				with: (each copyUpTo: $:) ] ].
	self renderBoxOn: html