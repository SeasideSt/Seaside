rendering
renderTopBarOn: html 
	| handler |
	html div
		class: 'topbar';
		with: [
			| selectedTools |
			handler := component selection.
			selectedTools := ((WAConfigurationToolPlugin 
				allSubclassesOn: handler
				for: component)
					select: [ :each | each isActive ]).
					
			(selectedTools	select: [ :each | each priority < 0 ])
				do: [ :each | html render: each ]
				separatedBy: [ html space ].
			html text: ' | '.	
			(selectedTools	select: [ :each | each priority >= 0 ])
				do: [ :each | html render: each ]
				separatedBy: [ html space ] ]