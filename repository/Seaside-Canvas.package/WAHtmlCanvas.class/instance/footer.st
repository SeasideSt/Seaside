tags
footer
	"The footer element represents the footer for the section it applies to. A footer typically contains information about its section such as who wrote it, links to related documents, copyright data, and the like.

	footer elements must not contain any footer, header, h1, h2, h3, h4, h5, or h6 elements, or any of the sectioning elements (such as section), as descendants.

	When used as an inline-level content container, the element represents a paragraph.

	Contact information for the section given in a footer should be marked up using the address element."
	^ self tag: 'footer'