Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-email' }
GRPharoPlatform >> isIpAddress: aString [
	| ip |
	ip := GRPlatform subStringsIn: aString splitBy: $..
	^ ip size = 4
		and: [ ip allSatisfy: [ :each |
				each greaseInteger notNil
					and: [ each greaseInteger between: 0 and: 255 ] ] ]
]

{ #category : #'*seaside-pharo-email' }
GRPharoPlatform >> seasideDeliverEmailMessage: aWAEmailMessage [

	| client server serverAddress |
	client := SMTPClient new.
	"user login information if applicable"
	self seasideSmtpUsername ifNotNil: [ :username | 
		client user: username.
		self seasideSmtpPassword ifNotNil: [ :password |
			client password: password ] ].
	"use HELO/EHLO ip address format [127.0.0.1] if local host name is ip"
	(self isIpAddress: client localHostName) 
		ifTrue: [ client localHostName: '[', client localHostName, ']' ].

	"deliver the mail"
	server := self seasideSmtpServer.
	serverAddress := (self isIpAddress: server)
		ifTrue: [ server ] 
		ifFalse: [ NetNameResolver addressForName: server ].
	client openOnHost: serverAddress port: self seasideSmtpPort.
	[ client 
		mailFrom: aWAEmailMessage from greaseString 
		to: aWAEmailMessage recipientsAddresses
		text: aWAEmailMessage plainMessage.
	client quit ]
		ensure: [ client close ]

]

{ #category : #'*seaside-pharo-email' }
GRPharoPlatform >> seasideSmtpPassword [

	^ self seasideHandlerPreferenceAt: #smtpPassword ifAbsent: [ nil ]
]

{ #category : #'*seaside-pharo-email' }
GRPharoPlatform >> seasideSmtpPort [

	^ self seasideHandlerPreferenceAt: #smtpPort ifAbsent: [ SMTPClient defaultPortNumber ]
]

{ #category : #'*seaside-pharo-email' }
GRPharoPlatform >> seasideSmtpServer [

	^ self seasideHandlerPreferenceAt: #smtpServer ifAbsent: [
		| mailSenderClass |
		mailSenderClass := (Smalltalk globals hasClassNamed: 'MailComposition')
			ifTrue: [ Smalltalk globals classNamed: 'MailComposition' ]
			ifFalse: [ Smalltalk globals classNamed: 'MailSender' ].
		mailSenderClass smtpServer ]
]

{ #category : #'*seaside-pharo-email' }
GRPharoPlatform >> seasideSmtpUsername [

	^ self seasideHandlerPreferenceAt: #smtpUsername ifAbsent: [ nil ]
]
