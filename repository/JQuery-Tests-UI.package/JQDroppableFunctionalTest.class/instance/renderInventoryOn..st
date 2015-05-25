rendering
renderInventoryOn: html
	html div class: 'inventory ui-corner-all'; with: [ 
		self colors do: [ :each |
			html div
				class: each;
				passenger: each;
				script: (html jQuery new draggable
					revert: true) ] ]