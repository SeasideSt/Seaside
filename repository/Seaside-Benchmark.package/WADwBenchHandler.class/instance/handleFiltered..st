handling
handleFiltered: aRequestContext
	aRequestContext respond: [ :response |
		| document renderContext htmlRoot |
		response contentType: WAMimeType textHtml.
		document := aRequestContext newDocument.
		renderContext := WARenderContext new.
		"Hook objects together"
		renderContext document: document.
		htmlRoot := WAHtmlRoot context: renderContext.
		
		"Render"
		document open: htmlRoot.
		self generateDWBenchOn: (WAHtmlCanvas context: renderContext) ]