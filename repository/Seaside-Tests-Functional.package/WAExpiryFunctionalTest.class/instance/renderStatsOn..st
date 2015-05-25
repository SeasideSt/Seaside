rendering
renderStatsOn: html
	html table: [
		html tableRow: [
			html tableHeading: 'Total session instances'.
			html tableData: WAExpirySession allInstances size ].
		html tableRow: [
			html tableHeading: 'Cached session instances for this Application'.
			html tableData: self application cache size ].
		html tableRow: [
			html tableHeading: 'Total component instances'.
			html tableData: self class allInstances size ].
		html tableRow: [
			html tableHeading: 'Sessions created'.
			html tableData: WAExpirySession created ].
		html tableRow: [
			html tableHeading: 'Sessions unregistered'.
			html tableData: WAExpirySession unregistered ] ]