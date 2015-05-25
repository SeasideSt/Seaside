updating
updateRoot: anHtmlRoot
	"Override this method to modify the Root object of a Document while rendering. This
	method is usually called by a WAUpdateRootVisitor.
	
	If you are using Painters within a tree of Presenters/Components, this method will not
	be called unless the Painter is included in the list of children of the Presenter."