attributes
charset: aString
	"The charset attribute specifies the character encoding used by the document. This is a character encoding declaration. If the attribute is present in an XML document, its value must be an ASCII case-insensitive match for the string 'UTF-8' (and the document is therefore forced to use UTF-8 as its encoding).

The charset attribute on the meta element has no effect in XML documents, and is only allowed in order to facilitate migration to and from XHTML.

There must not be more than one meta element with a charset attribute per document."
	self
		greaseDeprecatedApi: 'WAMetaElement>>charset:'
		details: 'Use an HTTP Content-Type header on the linked resource instead. https://www.geeksforgeeks.org/what-are-the-html-tags-that-deprecated-in-html5/'.
	self attributes at: 'charset' put: aString