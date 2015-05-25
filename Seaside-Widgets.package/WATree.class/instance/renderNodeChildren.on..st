rendering-nodes
renderNodeChildren: aNode on: html
	| children |
	children := self childrenOf: aNode.
	children isEmpty ifFalse: [
		(self isExpanded: aNode) ifTrue: [
			html unorderedList: [
				children do: [ :each |
					self renderNode: each on: html ] ] ] ]