exporting
createStringMethodRefDictionary: methodRefStringAssociations
	| literals |
	literals := Dictionary new.
	methodRefStringAssociations do: [ :assoc |
		| methodReference keywords |
		methodReference := assoc key.
		keywords := assoc value.
		keywords do: [ :literal |
			| references |
			references := literals at: literal ifAbsentPut: [ Set new ].
			references add: methodReference ] ].
	^ literals 