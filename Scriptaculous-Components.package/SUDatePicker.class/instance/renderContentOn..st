rendering
renderContentOn: html
	uid ifNil: [ uid := html nextId ].
	html div
		id: uid;
		class: 'calendar';
		with: [ self renderBodyOn: html ]