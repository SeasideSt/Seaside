rendering
renderMessage: aBlock class: aString on: html
	html div class: 'message'; with: [
		html span class: 'user'; with: self username.
		html span class: aString; with: aBlock ]