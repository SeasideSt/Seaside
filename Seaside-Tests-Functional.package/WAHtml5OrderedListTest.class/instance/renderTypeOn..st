rendering
renderTypeOn: html
	html label
		for: html nextId;
		with: 'type:'.
	html space.
	html select
		id: html lastId;
		list: self types;
		selected: type;
		labels: [ :s | self typesDictionary at: s ];
		callback: [ :value | type:= value ]