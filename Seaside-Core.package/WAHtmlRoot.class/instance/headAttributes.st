accessing-attributes
headAttributes
	^ headAttrs ifNil: [ headAttrs := WAHtmlAttributes new ]