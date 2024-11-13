attributes
shadowRootDelegatesFocus: aBoolean
	"Sets the value of the delegatesFocus property of a ShadowRoot created using this element to true. If this is set and a non-focusable element in the shadow tree is selected, then focus is delegated to the first focusable element in the tree. The value defaults to false."
	self attributeAt: 'shadowrootdelegatesfocus' put: aBoolean