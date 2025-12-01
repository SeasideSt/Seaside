Extension { #name : 'GRPharoPlatformTest' }

{ #category : '*seaside-tests-pharo-email' }
GRPharoPlatformTest >> testIsIpAddress [
	self assert: (GRPlatform current isIpAddress: '1.2.3.4').
	self deny: (GRPlatform current isIpAddress: '1.2.3').
	self deny: (GRPlatform current isIpAddress: '1.2.3.4.5').
	self deny: (GRPlatform current isIpAddress: '1.2.3.444').
	self deny: (GRPlatform current isIpAddress: 'hostage')
]

{ #category : '*seaside-tests-pharo-email' }
GRPharoPlatformTest >> testSeasideSmtpServer [

	| seasideSmtpServer oldSmtpServer |
	oldSmtpServer := [ MailComposition smtpServer ] on: Error do: [ :e | 	"If the smtpServer was not set, an error is thrown. Set it back to nil afterwards." nil ].
	MailComposition setSmtpServer: '1.2.3.4'.
	[ seasideSmtpServer := GRPlatform current seasideSmtpServer ] 
		ensure: [ MailComposition setSmtpServer: oldSmtpServer ].
	self assert: seasideSmtpServer isString
]
