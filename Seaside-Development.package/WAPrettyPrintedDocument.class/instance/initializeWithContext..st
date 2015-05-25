initialization
initializeWithContext: aRenderContext
	self initializeWithStream: aRenderContext document stream codec: self requestContext codec.
	xmlEncoder := GRPlatform current xmlEncoderOn: (singleEncoder := xmlEncoder). "we want double escapting to happen"
	html := WAHtmlCanvas context: aRenderContext.
	indentCloseTags := OrderedCollection with: false.
	indentLevel := 0.
	firstLine := true