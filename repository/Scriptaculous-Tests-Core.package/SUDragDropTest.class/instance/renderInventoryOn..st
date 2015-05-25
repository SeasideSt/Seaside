rendering
renderInventoryOn: html
	html div class: 'inventory'; with: [
		self inventory
			do: [ :each |
				html span
					passenger: each;
					class: 'inventory-item';
					script: (html scriptaculous draggable revert: true);
					with: each ]
			separatedBy: [ html text: ', ' ] ]