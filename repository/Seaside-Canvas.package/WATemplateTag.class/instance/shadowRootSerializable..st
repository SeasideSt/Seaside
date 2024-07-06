attributes
shadowRootSerializable: aBoolean
	"Sets the value of the serializable property of a ShadowRoot created using this element to true. If set, the shadow root may be serialized by calling the Element.getHTML() or ShadowRoot.getHTML() methods with the options.serializableShadowRoots parameter set true. The value defaults to false."
	self attributeAt: 'shadowrootserializable' put: aBoolean