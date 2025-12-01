Extension { #name : 'GRSqueakPlatformTest' }

{ #category : '*seaside-tests-squeak-email' }
GRSqueakPlatformTest >> setSmtpServer: aString [

	[ MailSender setSmtpServer ]
		on: ProvideAnswerNotification
		do: [ :n | n resume: (aString ifNil: [ '' ] ) ]
]

{ #category : '*seaside-tests-squeak-email' }
GRSqueakPlatformTest >> testIsIpAddress [
	self assert: (GRPlatform current isIpAddress: '1.2.3.4').
	self deny: (GRPlatform current isIpAddress: '1.2.3').
	self deny: (GRPlatform current isIpAddress: '1.2.3.4.5').
	self deny: (GRPlatform current isIpAddress: '1.2.3.444').
	self deny: (GRPlatform current isIpAddress: 'hostage')
]

{ #category : '*seaside-tests-squeak-email' }
GRSqueakPlatformTest >> testSeasideSmtpServer [

	| seasideSmtpServer oldSmtpServer |
	oldSmtpServer := [ MailSender smtpServer ] on: ProvideAnswerNotification do: [ :e |
		"If the smtpServer was not set, an notification is raised. Set it back to nil afterwards."
		nil ].
	self setSmtpServer: '1.2.3.4'.
	[ seasideSmtpServer := GRPlatform current seasideSmtpServer ] 
		ensure: [ self setSmtpServer: oldSmtpServer ].
	self assert: seasideSmtpServer isString
]
