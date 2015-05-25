rendering
renderRow: anObject level: anInteger on: html
	"Render a specific row anObject at level anInteger."
	
	html tableRow id: (self uid: anObject on: html); with: [
		columns keysAndValuesDo: [ :index :each |
			html tableData: [
				index = 1 
					ifFalse: [ each render: anObject on: html ]
					ifTrue: [ each render: anObject indent: anInteger on: html ] ] ] ]