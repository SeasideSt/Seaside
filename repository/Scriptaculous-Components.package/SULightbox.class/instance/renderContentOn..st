rendering
renderContentOn: html
	super renderContentOn: html.
	html div id: 'overlay'.
	html div
		id: 'lightbox';
		style: 'display: none';
		with: self delegate.
	html document addLoadScriptFirst: self lighter