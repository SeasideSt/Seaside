private
generateDWBenchOn: html
	html heading: 'DW-Bench Dynamic'. 
	html table
		attributeAt: 'border' put: 1;
		with: [
			1 to: 25 do: [ :row |
				html tableRow: [
					1 to: 25 do: [ :col |
						html tableData: row * col ] ] ] ].
	html paragraph: [
		html text: Date today yyyymmdd.
		html text: ''.
		html text: Time now print24 ]