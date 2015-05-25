rendering
renderHeadOn: html
	"Display the column titles of the tree report."
	
	html tableRow: [
		columns do: [ :each | 
			html tableHeading: each label ] ]