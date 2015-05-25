rendering
renderEntityTableHeadOn: html
	html tableHead: [
		html tableRow: [
			#('Character' 'Entity' 'Decimal' 'Hex') do: [ :each |
				html tableHeading
					scope: 'col'; rowSpan: 2;
					with: each ].
			html tableHeading
				scope: 'colgroup'; colSpan: 3;
				with: 'Rendering in Your Browser' ].
		html tableRow: [
			#('Entity' 'Decimal' 'Hex') do: [ :each |
				html tableHeading scope: 'col'; with: each ] ] ]