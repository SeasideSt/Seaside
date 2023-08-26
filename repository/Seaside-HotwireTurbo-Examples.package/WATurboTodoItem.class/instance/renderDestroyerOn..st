rendering
renderDestroyerOn: html

	html form: [ 
		html button
			class: 'destroy';
			turboStreamCallback: [ :ts | self remove. ts removeComponent: self ] ]