"
A WAEmailErrorHandler is an error handler that sends out email messages with the stack strace. 

This class can be used as is by sending the class-side message #configureHandlerFrom:to:mailhost: to configure the from, to and mailhost to be used.

If you want to create a custom email handler, then subclass this class and override the #to, #from, and #handleDefault  messages.
"
Class {
	#name : #WAEmailErrorHandler,
	#superclass : #WAErrorHandler,
	#classVars : [
		'From',
		'To'
	],
	#category : 'Seaside-GemStone-Email'
}

{ #category : #configuration }
WAEmailErrorHandler class >> configureHandlerFrom: fromEmailAddress to: toEmailAddress mailhost: mailhost [
	"WAEmailErrorHandler 
		configureHandlerFrom: 'dhenrich@gemstone.com' 
		to: 'dhenrich@gemstone.com' 
		mailhost: 'mail.gemstone.com'
	"

	From := WAEmailAddress address: fromEmailAddress.
	To := WAEmailAddress address: toEmailAddress.
	SendMail mailhost: mailhost
]

{ #category : #private }
WAEmailErrorHandler >> bodyFor: anError [
	^WAStringEmailBody string: (GsProcess stackReportToLevel: 1000)
]

{ #category : #private }
WAEmailErrorHandler >> from [
	"ansers the WAEmailAddress instance used as a sender address"	
	
	^From
]

{ #category : #actions }
WAEmailErrorHandler >> handleDefault: anException [

	self sendFailFor: anException.
	self responseFor: anException
]

{ #category : #private }
WAEmailErrorHandler >> responseFor: anException [
	| content |
	content := WARenderer default builder
		fullDocument: true;
		rootBlock: [ :root | root title: 'Internal Error ' ];
		render: [ :html |
			html heading level1; with: anException description.
			html paragraph: 'An internal error has been encountered. The maintainers of the site have been notified.' ].
	self requestContext respond: [ :response |
		response
			internalError;
			nextPutAll: content ]
]

{ #category : #private }
WAEmailErrorHandler >> sendFailFor: anError [
	| message |
	message := WAEmailMessage
		from: self from
		to: self to
		subject: (self subjectFor: anError).
	message body: (self bodyFor: anError).
	message send
]

{ #category : #private }
WAEmailErrorHandler >> subjectFor: anError [
	^anError description
]

{ #category : #private }
WAEmailErrorHandler >> to [
	"ansers the WAEmailAddress instance to which the error mail should be sent"

	^To
]
