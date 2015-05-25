*seaside-email
seasideSmtpPassword

	"^ self seasideApplicationPreferenceAt: #smtpPassword ifAbsent: [?]"
	self subclassResponsibility