rendering
renderPackagesOn: html
	| workingCopies |
	workingCopies :=  [ self sortedWorkingCopies ]
		on: Error
		do: [ :e |
			html render: 'Could not resolve working copies'.
			^ self ].
	html table: [
		html tableHead: [
			html tableRow: [
				html tableHeading: 'Package'.
				html tableHeading: 'Version' ] ].
		workingCopies do: [ :category |
			html tableRow: [
				html tableHeading: category key.
				html tableHeading ].
			category value do: [ :each |
				html tableRow: [
					html tableData: each packageName.
					html tableData: (each ancestry ancestorString copyAfterLast: $-) ] ] ] ]