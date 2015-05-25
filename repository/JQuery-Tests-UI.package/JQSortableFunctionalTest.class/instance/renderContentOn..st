rendering
renderContentOn: html
	html unorderedList
		script: (html jQuery new sortable
			onStop: (html jQuery ajax
				callback: [ :values | items := values ]
				passengers: (html jQuery this find: 'li')));
		with: [
			items do: [ :each |
				html listItem
					class: 'ui-corner-all';
					passenger: each;
					with: each ] ]