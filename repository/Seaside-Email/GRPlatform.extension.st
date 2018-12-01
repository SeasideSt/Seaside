Extension { #name : #GRPlatform }

{ #category : #'*seaside-email' }
GRPlatform >> seasideDeliverEmailMessage: aWAEmailMessage [

	self subclassResponsibility
]

{ #category : #'*seaside-email' }
GRPlatform >> seasideHandlerPreferenceAt: aKey ifAbsent: aBlock [
		
	^ [ WACurrentRequestContext value application preferenceAt: aKey ] "in a Seaside context"
		on: WARequestContextNotFound, WAAttributeNotFound 
		do: [ :ex | aBlock value ] "not in a Seaside context, treat as absent"
]

{ #category : #'*seaside-email' }
GRPlatform >> seasideSmtpPassword [

	"^ self seasideApplicationPreferenceAt: #smtpPassword ifAbsent: [?]"
	self subclassResponsibility
]

{ #category : #'*seaside-email' }
GRPlatform >> seasideSmtpPort [

	"^ self seasideApplicationPreferenceAt: #smtpPort ifAbsent: [?]"
	self subclassResponsibility
]

{ #category : #'*seaside-email' }
GRPlatform >> seasideSmtpServer [
	
	"^ self seasideApplicationPreferenceAt: #smtpServer ifAbsent: [?]"
	self subclassResponsibility
]

{ #category : #'*seaside-email' }
GRPlatform >> seasideSmtpUsername [

	"^ self seasideApplicationPreferenceAt: #smtpUsername ifAbsent: [?]"
	self subclassResponsibility
]
