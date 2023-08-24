rendering
renderDestroyerOn: html

	html form: [ 
		html button
			class: 'destroy';
			turboStreamCallback: [ :ts | ts remove: self remove ] ]