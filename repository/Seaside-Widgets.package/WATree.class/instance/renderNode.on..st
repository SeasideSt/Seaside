rendering-nodes
renderNode: aNode on: html
	html listItem: [
		self renderNodeButton: aNode on: html.
		self renderNodeLabel: aNode on: html.
		self renderNodeChildren: aNode on: html ]