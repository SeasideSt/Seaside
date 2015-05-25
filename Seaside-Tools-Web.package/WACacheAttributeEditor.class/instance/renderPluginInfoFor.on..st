rendering
renderPluginInfoFor: aCachePlugin on: html
	html tableData: aCachePlugin class name.
	html tableData: [
		html anchor
			callback: [ self show: aCachePlugin configuration configurationComponent ];
			with: 'Configure' ]