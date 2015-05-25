private
queryFieldKeyFromContext: aRequestContext
	^ aRequestContext request at: self keyField ifAbsent: [ nil ]