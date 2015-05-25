*seaside-pharo-email
seasideSmtpPassword

	^ self seasideHandlerPreferenceAt: #smtpPassword ifAbsent: [ nil ]