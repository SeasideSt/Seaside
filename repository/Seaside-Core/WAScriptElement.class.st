"
The SCRIPT element places a script within a document. This element may appear any number of times in the HEAD of an HTML document.

The script may be defined within the contents of the SCRIPT element or in an external file. If the src attribute is not set, user agents must interpret the contents of the element as the script. If the src has a URI value, user agents must ignore the element's contents and retrieve the script via the URI. Note that the charset attribute refers to the character encoding of the script designated by the src attribute; it does not concern the content of the SCRIPT element.
"
Class {
	#name : #WAScriptElement,
	#superclass : #WAContentElement,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #types }
WAScriptElement >> beJavascript [
	self type: WAMimeType textJavascript
]

{ #category : #attributes }
WAScriptElement >> defer [
	"When set, this boolean attribute provides a hint to the user agent that the script is not going to generate any document content (e.g., no 'document.write' in javascript) and thus, the user agent can continue parsing and rendering."
	self attributeAt: 'defer' put: true
]

{ #category : #accessing }
WAScriptElement >> tag [
	^ 'script'
]

{ #category : #attributes }
WAScriptElement >> url: aString [
	self attributeAt: 'src' put: aString
]
