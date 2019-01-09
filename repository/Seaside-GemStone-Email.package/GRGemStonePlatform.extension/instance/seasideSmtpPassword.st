*seaside-gemstone-email
seasideSmtpPassword

	^ self seasideHandlerPreferenceAt: #smtpPassword ifAbsent: [nil]