*seaside-pharo-email
seasideSmtpServer

	^ self seasideHandlerPreferenceAt: #smtpServer ifAbsent: [
		| mailSenderClass |
		mailSenderClass := (Smalltalk globals hasClassNamed: 'MailComposition')
			ifTrue: [ Smalltalk globals hasClassNamed: 'MailComposition' ]
			ifFalse: [ Smalltalk globals hasClassNamed: 'MailSender' ].
		mailSenderClass smtpServer ]