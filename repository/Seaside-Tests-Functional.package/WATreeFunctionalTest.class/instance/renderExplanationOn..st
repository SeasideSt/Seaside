rendering
renderExplanationOn: html
	html paragraph: [
		html text: 'This is a functional test for WATree.'.
		html orderedList: [
			html listItem: 'Clicking on ''+'' should expand a node'.
			html listItem: 'Clicking on ''-'' should collapse a node'.
			html listItem: 'Clicking on a node should display its name after ''Selected:'''.
			html listItem: 'Leaf nodes should not be clickable' ] ]