rendering
renderPropertiesOn: html
	html tableRow: [
		html tableHeading: 'Properties:'.
		html tableData: [
			| properties |
			properties := self requestContext properties.
			properties isEmpty ifFalse: [
				html definitionList: [
					properties keysAndValuesDo: [ :key :value |
						html definitionTerm: key.
						html definitionData: value ] ] ] ] ]