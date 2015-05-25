rendering
renderContentOn: html
	html div class: 'window'; with: [
		html div class: 'window-titlebar'; with: [
			html div class: 'window-title'; class: cssClass; with: title.
			html div class: 'window-close'; with: [ self renderCloseButtonOn: html ] ].
		html div class: 'window-content'; with: [ self renderNextOn: html ] ]