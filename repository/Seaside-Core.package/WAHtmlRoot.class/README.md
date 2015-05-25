A WAHtmlRoot is the root element of an HTML Document (<html>).

Instance Variables
	bodyAttrs:		<WAHtmlAttributes>
	context:			<WARenderContext>
	docType:		<String>
	headAttrs:		<WAHtmlAttributes>
	headElements:	<OrderedCollection<WAHtmlElement>>
	htmlAttrs:		<WAHtmlAttributes>
	scripts:			<Set<String>>
	styles:			<Set<String>>
	title:			<String>

bodyAttrs
	- the attributes of the <body> element

context
	- the context used to render the contents of the <body> element

docType
	- the document type

headAttrs
	- the attributes of the <head> element

headElements
	- the elements inside the <head> section

htmlAttrs
	- the attributes of the <html> element

scripts
	- contains the strings returned by WAPresenter >> #script

styles
	- contains the strings returned by WAPresenter >> #style

title
	- the title of the HTML document, the contents of the <title> element
