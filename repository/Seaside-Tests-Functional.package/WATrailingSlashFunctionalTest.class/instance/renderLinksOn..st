rendering
renderLinksOn: html
	html table: [
		html tableRow: [
			html tableData: [
				self renderSlashSuccess: true on: html ].
			html tableData: [
				html anchor
				url: (self baseUrlWithSlash: true);
				with: 'With Slash' ] ].
		
		html tableRow: [
			html tableData: [
				self renderSlashSuccess: false on: html ].
			html tableData: [
				html anchor
				url: (self baseUrlWithSlash: false);
				with: 'Without Slash' ] ] ]