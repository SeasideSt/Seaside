rendering
renderContentOn: html
	html heading: 'Seaside WebComponents Demo'.
	(html tag: 'wa-component')
		attributeAt: 'url' put: '/examples/headless-counter';
		attributeAt: 'ajaxify' put: 'true';
		with: 'Loading...'.
	html script: '
		const components = document.getElementsByTagName("wa-component");
		for (const component of components) {
			component.addEventListener("wa-component.xhr", (event) => {
				console.error("wa-component xhr call failed %O", event) });
		};'
	