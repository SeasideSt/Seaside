rendering
renderContentOn: html

	| showId |
	showId := html nextId.
	
	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a Seaside package name (no callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete sourceCallback: [ :term |
						 self packageNamesFor: term ]) ].

	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a Seaside package name (with callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete
					 search: [ :term | self packageNamesFor: term ]
					 labels: [ :packagename | packagename ]
					 callback: [ :val :s |
						 selectedPackageName := val.
						 s << (s jQuery id: showId) html: [ :r | self renderSelectedPackageNameOn: r ] ]).
		html break.
		html div
			id: showId;
			with: [ self renderSelectedPackageNameOn: html ] ]