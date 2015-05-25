rendering
renderIdTestOn: canvas
	self
		renderInline: [ :html | 
			| id1 |
			id1 := html nextId.
			html span
				id: id1;
				with: id1.
			html break ]
		key: #id
		on: canvas