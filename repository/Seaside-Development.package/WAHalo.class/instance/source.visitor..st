rendering-modes
source: html visitor: aPainterVisitor
	"Render the HTML source of the object we are wrapping using a pretty printed
	document. See #modes.
	Because we are using a new RenderContext, we can't use the passed-in visitor.
	Since we know we want to immediately render, we create a new WARenderVisitor to get
	things rolling. Rendering will then continue with the visitors in the context."
	
	| context |
	html div class: 'wa-halo-source'; with: [
		context := html context copy.
		context disableHalos.

		context document: (WAPrettyPrintedDocument context: html context).
		(WARenderVisitor context: context) start: self root.
		context document close ]