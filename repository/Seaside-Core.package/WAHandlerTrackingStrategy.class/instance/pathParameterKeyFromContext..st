private
pathParameterKeyFromContext: aRequestContext
	| url |
	url := aRequestContext request url.
	1 to: url path size do: [ :index |
		| key |
		key := url pathParameterAt: index key: self keyField ifAbsent: [ nil ].
		key isNil ifFalse: [
			^ key ] ].
	^ nil