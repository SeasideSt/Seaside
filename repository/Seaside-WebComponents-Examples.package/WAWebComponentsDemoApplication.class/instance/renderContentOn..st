rendering
renderContentOn: html
	html heading: 'Seaside WebComponents Demo'.
	(html tag: 'wa-component')
		attributeAt: 'url' put: '/examples/headless-counter';
		attributeAt: 'ajaxify' put: 'true';
		with: 'Loading...'