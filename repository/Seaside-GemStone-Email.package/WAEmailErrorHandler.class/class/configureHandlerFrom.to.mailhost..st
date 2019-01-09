configuration
configureHandlerFrom: fromEmailAddress to: toEmailAddress mailhost: mailhost
	"WAEmailErrorHandler 
		configureHandlerFrom: 'dhenrich@gemstone.com' 
		to: 'dhenrich@gemstone.com' 
		mailhost: 'mail.gemstone.com'
	"

	From := WAEmailAddress address: fromEmailAddress.
	To := WAEmailAddress address: toEmailAddress.
	SendMail mailhost: mailhost