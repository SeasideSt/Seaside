rendering
renderContentOn: html
	html div class: 'kalsey'; with: [
		html div
			class: 'navigation-options';
			with: [ self renderOptionsOn: html ].
		html div
			class: 'navigation-content';
			with: [ self renderSelectionOn: html ] ]