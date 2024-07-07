rendering
renderContentOn: html
	html heading: 'Seaside WebComponents Demo'.
	(html tag: 'seaside-component')
		attributeAt: 'url' put: '/examples/headless-counter';
		attributeAt: 'ajaxify' put: 'true';
		with: 'Loading...'.
	html break.
	
	(html tag: 'seaside-component')
		attributeAt: 'url' put: '/examples/headless-counter';
		attributeAt: 'ajaxify' put: 'true';
		with: 'Loading...'