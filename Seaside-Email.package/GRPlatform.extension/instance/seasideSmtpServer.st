*seaside-email
seasideSmtpServer
	
	"^ self seasideApplicationPreferenceAt: #smtpServer ifAbsent: [?]"
	self subclassResponsibility