rendering
renderToolbarOn: html
	html div class: 'wa-toolbar'; with: [
		(self plugins select: [ :each | each isActive ])
			do: [ :each | html render: each ]
			separatedBy: [ html text: ' ' ] ]