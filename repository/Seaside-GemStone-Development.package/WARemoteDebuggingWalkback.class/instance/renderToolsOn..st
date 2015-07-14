rendering
renderToolsOn: html
	html paragraph: [
		continuation ~~ nil 
			ifTrue: [
				html anchor
					callback: [ self addContinuation ];
				title: 'Put copy of process in queue for remote debugging';
				with: 'Remote Debug']
			ifFalse: [html strong: 'Already submitted for remote debugging'].
		self exception isResumable ifTrue: [
			html space.
			html anchor
				callback: [ self answer: false ];
				with: 'Proceed' ].
		limit < frames size ifTrue: [
			html space.
			html anchor
				callback: [ limit := frames size ];
				with: 'Full Stack' ] ]