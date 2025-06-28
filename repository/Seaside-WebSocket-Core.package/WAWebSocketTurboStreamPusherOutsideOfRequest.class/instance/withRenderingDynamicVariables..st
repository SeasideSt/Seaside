private
withRenderingDynamicVariables: aBlock

	| context |
	context := WARequestContext request: nil response: nil codec: self codec.
	WACurrentRequestContext
		use: context
		during: aBlock