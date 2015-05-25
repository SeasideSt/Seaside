rendering
renderContentOn: html 
	| aWindow |
	html div id: 'overlay'.
	html big: 'Window Test:'.
	html space.
	html anchor
		onClick: (html prototype evaluator callback: [ : script | windows first openOn: script ]) ;
		with: 'Open window 1'.
	html space: 2.
	html anchor
		onClick: (html prototype evaluator callback: [ : script | (windows at: 2) openOn: script ]) ;
		with: 'Open window 2'.
	html space: 2.
	html anchor
		onClick: (html prototype evaluator
					callback: [ : script | 
						script add: (JSStream on: 'Element.fullscreen("overlay")'). 
						(windows at: 4) openOn: script.
						script add: (JSStream on: 'Element.center("dialog_window")') ]) ;
		with: 'Open dialog window'.
	html space: 2.
	aWindow := windows at: 3.
	html anchor
		class: 'tt' ;
		attributeAt: 'rel'
			put: 'ok' ;
		with: 'Show tooltip 1'.
	html space: 2.
	html anchor
		class: 'tt' ;
		attributeAt: 'rel'
			put: 'hello' ;
		with: 'Show tooltip 2'.
	html space: 2.
	html anchor
		class: 'tt' ;
		attributeAt: 'rel'
			put: 'illegal' ;
		with: 'Show tooltip 3'.
	windows do: [ :w | html render: w ].
	self 
		tooltipScriptOn: html
		window: aWindow