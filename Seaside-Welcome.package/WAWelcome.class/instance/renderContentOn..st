rendering
renderContentOn: html
	html div
		class: 'container';
		with: [
			html div
				class: 'sidebar';
				with: [ self renderSideBarOn: html ].
			html div
				class: 'content';
				with: [ self renderMainContentOn: html ].
			html div class: 'clear' ]