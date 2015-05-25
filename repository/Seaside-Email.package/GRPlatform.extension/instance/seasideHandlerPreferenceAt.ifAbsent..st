*seaside-email
seasideHandlerPreferenceAt: aKey ifAbsent: aBlock
		
	^ [ WACurrentRequestContext value application preferenceAt: aKey ] "in a Seaside context"
		on: WARequestContextNotFound, WAAttributeNotFound 
		do: [ :ex | aBlock value ] "not in a Seaside context, treat as absent"