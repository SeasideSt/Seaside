rendering
renderContentOn: html
	html heading
		level: 1;
		with: (self object printStringLimitedTo: 50).
	html render: path.
	html form: [
		self renderMembersOn: html.
		self renderEditAreaOn: html ]