rendering
renderEntityTableBodyOn: html
	html tableBody: [
		self entities do: [ :eachEntity |
			html tableRow: [
				html tableData scope: 'row';
					with: eachEntity first.
				eachEntity second do: [ :each |
					html tableData: each ].
				eachEntity second do: [ :each |
					html tableData align: 'center';
						with: [ html html: each ] ] ] ] ]