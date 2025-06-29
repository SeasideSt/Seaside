*seaside-squeak-email
seasideSmtpUsername

	^ self
		seasideHandlerPreferenceAt: #smtpUsername
		ifAbsent: [ nil ]