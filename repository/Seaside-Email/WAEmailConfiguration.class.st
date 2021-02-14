Class {
	#name : #WAEmailConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Email-Configuration'
}

{ #category : #description }
WAEmailConfiguration >> describeOn: config [
	(config string: #smtpServer)
		group: #email;
		label: 'SMTP Server';
		comment: 'The hostname of the SMTP Server to use for sending Emails'.
	(config integer: #smtpPort)
		beAdvanced;
		group: #email;
		label: 'SMTP Port';
		comment: 'The port of the SMTP Server to use for sending Emails.';
		default: 25.
	(config string: #smtpUsername)
		beAdvanced;
		group: #email;
		label: 'SMTP Server user name';
		comment: 'The user name used to log into the SMTP Server to use for sending Emails'.
	(config string: #smtpPassword)
		beAdvanced;
		group: #email;
		label: 'SMTP Server password';
		comment: 'The password used to log into the SMTP Server to use for sending Emails'
]
