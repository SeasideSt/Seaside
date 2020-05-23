rendering
renderActionsOn: html
	html paragraph: [
		html anchor
			callback: [ self authentication ];
			with: 'Basic Authentication'.
		html text: ' (admin/seaside)'.
		html break.
		html anchor
			callback: [ self protectorByRemoteAddress ];
			with: 'Session Protector by remote address'.
		html break.
		html anchor
			callback: [ self protectorByBrowserSessionCookie ];
			with: 'Session Protector by session cookie' ].
	html horizontalRule.
	html paragraph: self children