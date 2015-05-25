rendering
renderContentOn: html
	html unorderedList
		script: (html jQuery new selectable
			onStop: (html jQuery ajax
				callback: [ :value | selected := value asSet ]
				passengers: (html jQuery this find: '.ui-selected')));
		with: [
			self vegetables do: [ :each |
				html listItem
					class: 'ui-corner-all';
					class: 'ui-selected' if: (selected includes: each);
					passenger: each;
					with: each ] ]