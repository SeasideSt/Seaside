rendering
renderComponentOn: html

	html heading level4; with: component class headerForExampleBrowser.
	html div
		class: 'component';
		with: component.
	hasAnswer ifTrue: [
		html div
			class: 'answer';
			with: answer printString ]