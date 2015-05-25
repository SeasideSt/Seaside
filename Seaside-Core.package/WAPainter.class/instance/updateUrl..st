updating
updateUrl: aUrl
	"Override this method to modify the WAUrl object which will be used as a base URL
	while rendering. This method is usually called by a WAUpdateUrlVisitor.
	
	If you are using Painters within a tree of Presenters/Components, this method will not
	be called unless the Painter is included in the list of children of the Presenter."