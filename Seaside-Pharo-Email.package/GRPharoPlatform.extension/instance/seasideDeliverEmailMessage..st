*seaside-pharo-email
seasideDeliverEmailMessage: aWAEmailMessage

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
