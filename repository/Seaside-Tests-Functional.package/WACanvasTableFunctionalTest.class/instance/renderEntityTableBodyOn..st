rendering
renderEntityTableBodyOn: html
	html tableBody: [
		self entities do: [ :eachEntity |
			html tableRow: [
				html tableHeading scope: 'row';
					with: eachEntity first.
				eachEntity second do: [ :each |
					html tableData: each ].
				eachEntity second do: [ :each |
					html tableData
						class: 'wacanvastabletest-aligncenter';
						with: [ html html: each ] ] ] ] ]