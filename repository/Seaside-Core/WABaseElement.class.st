"
In HTML, links and references to external images, applets, form-processing programs, style sheets, etc. are always specified by a URI. Relative URIs are resolved according to a base URI, which may come from a variety of sources. The BASE element allows authors to specify a document's base URI explicitly.

When present, the BASE element must appear in the HEAD section of an HTML document, before any element that refers to an external source. The path information specified by the BASE element only affects URIs in the document where the element appears.

For example, given the following BASE declaration and A declaration:
updateRoot: html
	super updateRoot: html.
	html base url: 'http://www.aviary.com/products/intro.html'

renderContentOn: html
	html anchor
		url: '../cages/birds.gif';
		with: 'Bird Cages'

the relative URI ""../cages/birds.gif"" would resolve to:
http://www.aviary.com/cages/birds.gif
"
Class {
	#name : #WABaseElement,
	#superclass : #WAHtmlElement,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #accessing }
WABaseElement >> tag [
	^ 'base'
]

{ #category : #attributes }
WABaseElement >> target: aString [ 
	"The target IDL attribute must reflect the content attribute of the same name."
	
	self attributes at: 'target' put: aString
]

{ #category : #attributes }
WABaseElement >> url: aString [
	self attributeAt: 'href' put: aString
]
