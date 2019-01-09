*seaside-gemstone-email
seasideSmtpUsername

	^ self seasideHandlerPreferenceAt: #smtpUsername ifAbsent: [nil]