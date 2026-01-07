"
The template HTML element serves as a mechanism for holding HTML fragments, which can either be used later via JavaScript or generated immediately into shadow DOM.
"
Class {
	#name : 'WATemplateTag',
	#superclass : 'WATagBrush',
	#category : 'Seaside-Canvas-Tags',
	#package : 'Seaside-Canvas',
	#tag : 'Tags'
}

{ #category : 'attributes' }
WATemplateTag >> shadowRootClonable: aBoolean [
	"Sets the value of the clonable property of a ShadowRoot created using this element to true. If set, a clone of the shadow host (the parent element of this <template>) created with Node.cloneNode() or Document.importNode() will include a shadow root in the copy."
	self attributeAt: 'shadowrootclonable' put: aBoolean
]

{ #category : 'attributes' }
WATemplateTag >> shadowRootDelegatesFocus: aBoolean [
	"Sets the value of the delegatesFocus property of a ShadowRoot created using this element to true. If this is set and a non-focusable element in the shadow tree is selected, then focus is delegated to the first focusable element in the tree. The value defaults to false."
	self attributeAt: 'shadowrootdelegatesfocus' put: aBoolean
]

{ #category : 'attributes' }
WATemplateTag >> shadowRootMode: aString [
	"Creates a shadow root for the parent element. It is a declarative version of the Element.attachShadow() method and accepts the same enumerated values.
	
	open
		Exposes the internal shadow root DOM for JavaScript (recommended for most use cases).
		
	closed
		Hides the internal shadow root DOM from JavaScript."
	self attributeAt: 'shadowrootmode' put: aString
]

{ #category : 'attributes' }
WATemplateTag >> shadowRootSerializable: aBoolean [
	"Sets the value of the serializable property of a ShadowRoot created using this element to true. If set, the shadow root may be serialized by calling the Element.getHTML() or ShadowRoot.getHTML() methods with the options.serializableShadowRoots parameter set true. The value defaults to false."
	self attributeAt: 'shadowrootserializable' put: aBoolean
]

{ #category : 'accessing' }
WATemplateTag >> tag [
	^ 'template'
]
