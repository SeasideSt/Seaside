rendering
renderConfigurationOn: html
	html label: 'Plugins configured:'.
	html table
		cellspacing: 0;
		cellpadding: 0;
		with: [
		html tableRow: [
			html tableData: 'Expiry Policy'.
			self renderPluginInfoFor: self configuration expiryPolicy on: html ].
		html tableRow: [
			html tableData: 'Reaping Strategy'.
			self renderPluginInfoFor: self configuration reapingStrategy on: html  ].
		html tableRow: [
			html tableData: 'Removal Action'.
			self renderPluginInfoFor: self configuration removalAction on: html ].
		html tableRow: [
			html tableData: 'Cache Miss Strategy'.
			self renderPluginInfoFor: self configuration missStrategy on: html ] ] .
			
		self renderCacheReplaceOn: html