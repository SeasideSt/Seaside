rendering
renderNode: anObject on: html
	| children |
	html text: anObject.
	(children := self childrenOf: anObject) isEmpty ifFalse: [
		html unorderedList: [
			self renderChildren: children on: html ] ]