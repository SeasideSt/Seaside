rendering
renderChildrenOn: html
	"Standard version of child layout."
	
	html div id: 'content'; with: [
		selected do: [ :each | html heading: each key; render: each value ] ]