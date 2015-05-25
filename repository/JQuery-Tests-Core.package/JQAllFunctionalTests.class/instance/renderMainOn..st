rendering
renderMainOn: html
	html div class: 'main'; with: [
		html heading
			level: 3;
			with: contents title.
		contents selectors isEmpty
			ifTrue: [ html render: contents ]
			ifFalse: [ self renderBrowserOn: html ] ]