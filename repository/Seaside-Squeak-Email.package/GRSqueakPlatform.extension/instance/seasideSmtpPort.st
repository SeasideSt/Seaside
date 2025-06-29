*seaside-squeak-email
seasideSmtpPort

	^ self
		seasideHandlerPreferenceAt: #smtpPort
		ifAbsent: [ SMTPClient defaultPortNumber ]