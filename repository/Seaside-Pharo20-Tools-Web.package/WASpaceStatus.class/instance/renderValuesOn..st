rendering
renderValuesOn: html
	| items totalSpaceForInstances |
	items := self spaceTallyItems.
	totalSpaceForInstances := 0.
	items do: [ :each |
		totalSpaceForInstances := totalSpaceForInstances + each spaceForInstances  ].
	html table: [
		html tableHead: [
			html tableRow: [
				html tableHeading: 'Class'.
				html tableHeading: 'code space'.
				html tableHeading: '# instances'.
				html tableHeading: 'inst space'.
				html tableHeading: 'percent' ] ].
		html tableBody: [
			items do: [ :each |
				html tableRow: [
					html tableHeading align: 'right'; with: each analyzedClassName.
					self renderValue: each codeSize on: html.
					self renderValue: each instanceCount on: html.
					self renderValue: each spaceForInstances on: html.
					self renderValue: (self percent: each spaceForInstances / totalSpaceForInstances) on: html  ] ] ] ]
	
