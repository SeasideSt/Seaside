Extension { #name : #GRGemStonePlatform }

{ #category : #'*seaside-gemstone-email' }
GRGemStonePlatform >> seasideDeliverEmailMessage: aWAEmailMessage [
  | client stream headers |
  client := SendMail new.	"user login information if applicable"
  self seasideSmtpUsername
    ifNotNilDo: [ :username | 
      client user: username.
      self seasideSmtpPassword
        ifNotNilDo: [ :password | client password: password ] ].	"use HELO/EHLO ip address format [127.0.0.1] if local host name is ip"
  (self seasideIsIpAddress: client ownDomainName)
    ifTrue: [ client ownDomainName: '[' , client ownDomainName , ']' ]
    ifFalse: [ 
      (client ownDomainName findTokens: '.') size > 1
        ifFalse: [ 
          "no FQDN, Emulate"
          client
            ownDomainName:
              (client class
                getHostNameByAddress:
                  (client class getHostAddressByName: client ownDomainName)) ] ].	"headers"
  headers := client headers.	"We need to send #greaseString to both, key and value, as WAEmailMessage >> #plainMessage  does...the reason is that we can have some objects there (like aWAMimeType intstances (see WAMultiPartEmailMessage >> #initialize for example)...so if we don't do #greaseString, we get the defalt printString which may be wrong...as it is the case of WAMimeType."
  aWAEmailMessage headers
    keysAndValuesDo: [ :key :value | headers at: key greaseString put: value greaseString ].
  headers
    at: 'Bcc'
    put:
      (String
        streamContents: [ :stream | 
          aWAEmailMessage bcc
            do: [ :address | stream nextPutAll: address greaseString ]
            separatedBy: [ stream nextPut: $, ] ]).	"deliver the mail"
  client
    mailhostName: self seasideSmtpServer;
    smtpPort: self seasideSmtpPort;
    from: aWAEmailMessage from address greaseString;
    rcptTo: aWAEmailMessage recipientsAddresses;
    to:
        (String
          streamContents: [ :stream | 
            aWAEmailMessage to
              do: [ :address | stream nextPutAll: address greaseString ]
              separatedBy: [ stream nextPut: $, ] ]);
    cc:
        (String
            streamContents: [ :stream | 
              aWAEmailMessage cc
                do: [ :address | stream nextPutAll: address greaseString ]
                separatedBy: [ stream nextPut: $, ] ]);
    subject: aWAEmailMessage subject greaseString;
    text:
        (String streamContents: [ :aStream | aWAEmailMessage writeBodyOn: aStream ]).	"We must delegate to #writeBodyOn: as such method knows how to deal with both, single and multipart emails"
  client send
]

{ #category : #'*seaside-gemstone-email' }
GRGemStonePlatform >> seasideIsIpAddress: aString [

	| ip |
	ip := aString findTokens: '.'.
	^ (ip size = 4) 
		ifFalse: [false]
		ifTrue: [
			ip allSatisfy: [:ea | ea greaseInteger
				ifNil: [false]
				ifNotNilDo: [:num | num between: 0 and: 255]]]
]

{ #category : #'*seaside-gemstone-email' }
GRGemStonePlatform >> seasideSmtpPassword [

	^ self seasideHandlerPreferenceAt: #smtpPassword ifAbsent: [nil]
]

{ #category : #'*seaside-gemstone-email' }
GRGemStonePlatform >> seasideSmtpPort [

	^ self seasideHandlerPreferenceAt: #smtpPort ifAbsent: [SendMail new smtpPort]
]

{ #category : #'*seaside-gemstone-email' }
GRGemStonePlatform >> seasideSmtpServer [
	
	^ self seasideHandlerPreferenceAt: #smtpServer ifAbsent: [SendMail mailhost]
]

{ #category : #'*seaside-gemstone-email' }
GRGemStonePlatform >> seasideSmtpUsername [

	^ self seasideHandlerPreferenceAt: #smtpUsername ifAbsent: [nil]
]
