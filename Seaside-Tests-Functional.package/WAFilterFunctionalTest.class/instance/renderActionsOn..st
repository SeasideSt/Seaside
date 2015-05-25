rendering
renderActionsOn: html
	html paragraph: [
		html anchor
			callback: [ self authentication ];
			with: 'Basic Authentication'.
		html text: ' (admin/seaside)'.
		html break.
		html anchor
			callback: [ self protector ];
			with: 'Session Protector' ].
	html horizontalRule.
	html paragraph: self children