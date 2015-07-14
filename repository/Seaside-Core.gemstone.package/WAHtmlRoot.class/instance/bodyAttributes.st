accessing-attributes
bodyAttributes
	^ bodyAttrs ifNil: [ bodyAttrs := WAHtmlAttributes new ]