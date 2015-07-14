*seaside-gemstone-email
seasideDeliverEmailMessage: aWAEmailMessage
    

	| client stream headers |
	client := SendMail new.

	"user login information if applicable"
	self seasideSmtpUsername ifNotNilDo: [:username | 
		client user: username.
		self seasideSmtpPassword ifNotNilDo: [:password |
			client password: password]].

	"use HELO/EHLO ip address format [127.0.0.1] if local host name is ip"
	(self seasideIsIpAddress: client ownDomainName)
		ifTrue: [client ownDomainName: '[', client ownDomainName, ']']
		ifFalse: [
			((client ownDomainName findTokens: '.') size > 1)
				ifFalse: ["no FQDN, Emulate"
					client ownDomainName:
						(client class getHostNameByAddress: (client class getHostAddressByName: client ownDomainName))]].


	"headers"

	headers := client headers.

	aWAEmailMessage headers keysAndValuesDo: [:key :value | 
			headers at: key put: value ].
	headers at: 'Bcc' put: (String streamContents: [:stream |
		aWAEmailMessage bcc 
			do: [:address | stream nextPutAll: address greaseString]
			separatedBy: [stream nextPut: $,]]).	

	"deliver the mail"
	client 
		mailhostName: self seasideSmtpServer;
		smtpPort: self seasideSmtpPort;
		from: aWAEmailMessage from address greaseString;
		rcptTo: aWAEmailMessage recipientsAddresses;			
		to: (String streamContents: [:stream |
			aWAEmailMessage to 
				do: [:address | stream nextPutAll: address greaseString]
				separatedBy: [stream nextPut: $,]]);
		cc: (String streamContents: [:stream |
			aWAEmailMessage cc 
				do: [:address | stream nextPutAll: address greaseString]
				separatedBy: [stream nextPut: $,]]);
		subject: aWAEmailMessage subject greaseString;
		text: aWAEmailMessage body greaseString.

	client send.