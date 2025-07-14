*seaside-squeak-email
seasideSmtpPassword

	^ self
		seasideHandlerPreferenceAt: #smtpPassword
		ifAbsent: [ nil ]