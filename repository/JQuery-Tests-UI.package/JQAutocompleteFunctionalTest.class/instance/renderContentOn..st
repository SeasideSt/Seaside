rendering
renderContentOn: html

	| showId |
	showId := html nextId.
	
	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a country name (no callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete sourceCallback: [ :term | self countryNamesFor: term ]) ].

	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a country name (with callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete
					 search: [ :term | self countryNamesFor: term ]
					 labels: [ :countryName | countryName ]
					 callback: [ :val :s |
						 selectedCountryName := val.
						 s << (s jQuery id: showId) html: [ :r | self renderSelectedCountryNameOn: r ] ]).
		html break.
		html div
			id: showId;
			with: [ self renderSelectedCountryNameOn: html ] ]