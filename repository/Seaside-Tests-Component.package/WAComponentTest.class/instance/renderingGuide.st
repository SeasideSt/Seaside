accessing
renderingGuide
	| context guide |
	context := self renderContext.
	guide := WARenderingGuide client: (WARenderVisitor context: context).
	context visitor: guide.
	^ guide