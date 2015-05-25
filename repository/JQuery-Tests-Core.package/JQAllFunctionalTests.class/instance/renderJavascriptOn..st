rendering-browser
renderJavascriptOn: html
	| context |
	html heading level: 4; with: 'Source'.
	html div class: 'code'; with: [
		context := html context copy.
		context document: (WAPrettyPrintedDocument context: html context).
		context document scriptGenerator: html document scriptGenerator class new.
		contents renderWithContext: context.
		context document scriptGenerator closeOn: context document ]