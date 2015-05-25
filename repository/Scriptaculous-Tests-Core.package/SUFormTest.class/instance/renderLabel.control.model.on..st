rendering-utilities
renderLabel: aString control: aBlock model: anObject on: html
	| fid mid |
	fid := mid := nil.
	html div class: 'row'; with: [
		html div class: 'label'; with: aString.
		html div class: 'control'; with: [
			html form
				id: (fid := html nextId);
				with: [ html div: [ aBlock value: fid value: (mid := html nextId) ] ] ].
		html div class: 'model'; id: mid; with: anObject.
		html div class: 'clear' ]