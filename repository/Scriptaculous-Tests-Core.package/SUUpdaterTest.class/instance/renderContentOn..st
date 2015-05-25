rendering
renderContentOn: html
	| elementId |
	elementId := html nextId.
	html paragraph: [
		(self insertionsFromFactory: html prototype) do: [ :each |
			html anchor
				onClick: (html scriptaculous updater
					id: elementId;
					insertion: each;
					on: #renderElementOn: of: self);
				with: each.
			html break ] ].
	html div: [ html div class: 'targetElement'; id: elementId; with: 'Target Element' ]