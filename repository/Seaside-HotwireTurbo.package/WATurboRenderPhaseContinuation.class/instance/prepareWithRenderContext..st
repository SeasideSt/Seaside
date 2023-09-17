accessing
prepareWithRenderContext: aContext

	renderContext := aContext.
	turboStreamCallback := renderContext callbacks findTurboStreamCallbackIn: self requestContext request
