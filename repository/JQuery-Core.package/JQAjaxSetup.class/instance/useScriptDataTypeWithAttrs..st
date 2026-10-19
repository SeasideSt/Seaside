options
useScriptDataTypeWithAttrs: anObject
	"Configure script response handling and script tag attributes (for example, CSP nonce/integrity)."

	self useScriptDataType.
	self scriptAttrs: anObject