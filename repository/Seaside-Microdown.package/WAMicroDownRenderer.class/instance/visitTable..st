visiting
visitTable: aTable

	canvas table: [ 
		aTable rows do: [ :row |
			canvas tableRow: [
				row do: [ :el |
					canvas tableData: [ el do: [ :some | some accept: self ] ] ] ] ] ]