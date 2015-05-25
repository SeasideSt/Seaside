rendering
renderTasksOn: html
	tasks do: [ :each |
		html div: [
			html div: each.
			html anchor
				callback: [ tasks remove: each ];
				with: '(remove task)' ] ]