accessing-attributes
htmlAttributes
	^ htmlAttrs ifNil: [ htmlAttrs := WAHtmlAttributes new ]