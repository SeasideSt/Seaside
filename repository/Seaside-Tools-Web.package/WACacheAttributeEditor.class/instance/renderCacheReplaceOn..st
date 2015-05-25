rendering
renderCacheReplaceOn: html
	html paragraph: [
		html anchor
			class: 'large';
			title: 'Replace the cache to initialize all plugins';
			callback: [ self replaceCache ];
			with: 'Replace cache' ]