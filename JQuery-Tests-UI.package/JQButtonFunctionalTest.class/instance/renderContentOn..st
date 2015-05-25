rendering
renderContentOn: html
	html form 
		id: 'toolbar';
		class: 'ui-widget-header';
		class: 'ui-corner-all'; 
		with: [ 
			self renderAnchorOn: html.
			self renderCheckboxOn: html.
			self renderOptionOn: html ]