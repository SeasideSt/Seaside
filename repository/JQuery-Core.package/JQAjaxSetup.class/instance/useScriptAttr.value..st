options
useScriptAttr: aString value: anObject
	"Configure script response handling and merge one scriptAttrs entry."

	| attrs |
	self useScriptDataType.
	attrs := self options at: 'scriptAttrs' ifAbsent: [ GRSmallDictionary2 new ].
	(attrs respondsTo: #at:put:)
		ifFalse: [ attrs := GRSmallDictionary2 new ].
	attrs at: aString put: anObject.
	self scriptAttrs: attrs