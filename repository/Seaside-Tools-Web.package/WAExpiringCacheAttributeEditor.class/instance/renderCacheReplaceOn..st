rendering
renderCacheReplaceOn: html
	html paragraph: [
		html button
			class: 'large';
			title: 'Replace the cache';
			callback: [ self replaceCache ];
			with: 'Replace cache' ]