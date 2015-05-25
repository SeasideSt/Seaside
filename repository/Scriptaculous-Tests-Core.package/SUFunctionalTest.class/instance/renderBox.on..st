rendering
renderBox: aString on: html
	html div id: aString; class: 'box'; with: [
		html div class: 'header'.
		html div
			class: 'content';
			with: 'Smalltalk Enterprise Aubergines' ]