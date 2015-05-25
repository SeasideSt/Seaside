rendering
renderReversedOn: html
			
	html checkbox
		id: html nextId;
		value: reversed;
		callback: [ :value | reversed := value ].
	html space.
	html label
		for: html lastId;
		with: 'reversed'