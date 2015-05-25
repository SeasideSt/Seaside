A Painter is an object that renders onto a Document using a Renderer (typically a subclass of WACanvas). The class of the Renderer is specified by #rendererClass.

Subclasses should implement #renderContentOn: to do the actual rendering.

Painters do not store or backtrack state and do not provide call/answer semantics or decorations. They are often created for each request, used, and then discarded. If you want any of the above features, you should use a subclass of WAPresenter or WAComponent.

To cause a Painter to render itself, you should pass it to the #render: message of a Renderer. For example, from within a Component you could do the following:

	renderContentOn: html
		html render: MyPainterSubclass new