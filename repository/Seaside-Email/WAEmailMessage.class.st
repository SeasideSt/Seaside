"
I am a  general email message (single part).
"
Class {
	#name : #WAEmailMessage,
	#superclass : #WAObject,
	#instVars : [
		'to',
		'from',
		'cc',
		'bcc',
		'subject',
		'headers',
		'body',
		'replyTo'
	],
	#category : 'Seaside-Email-Base'
}

{ #category : #'instance creation' }
WAEmailMessage class >> from: aFromEmailAddress to: aToEmailAddress subject: aString [
	^ self new
		from: aFromEmailAddress;
		addTo: aToEmailAddress;
		subject: aString;
		yourself
]

{ #category : #'instance creation' }
WAEmailMessage class >> from: aFromEmailAddress toAll: aCollectionOfEmailAddress subject: aString [
	^ self new
		from: aFromEmailAddress;
		addAllTo: aCollectionOfEmailAddress;
		subject: aString;
		yourself
]

{ #category : #adding }
WAEmailMessage >> addAllTo: aCollectionOfEmailAddress [
	aCollectionOfEmailAddress do: [ :each |
		self addTo: each ]
]

{ #category : #adding }
WAEmailMessage >> addBcc: anEmailAddress [
	^ self bcc add: anEmailAddress
]

{ #category : #adding }
WAEmailMessage >> addCc: anEmailAddress [
	^ self cc add: anEmailAddress
]

{ #category : #adding }
WAEmailMessage >> addTo: anEmailAddress [
	^ self to add: anEmailAddress
]

{ #category : #accessing }
WAEmailMessage >> bcc [
	^ bcc
]

{ #category : #accessing }
WAEmailMessage >> body [
	^ body
]

{ #category : #accessing }
WAEmailMessage >> body: anObject [
	body := anObject
]

{ #category : #accessing }
WAEmailMessage >> cc [
	^ cc
]

{ #category : #accessing }
WAEmailMessage >> from [
	^ from
]

{ #category : #accessing }
WAEmailMessage >> from: anObject [
	from := anObject
]

{ #category : #adding }
WAEmailMessage >> headerAt: aKeyString put: aValueString [
	^ self headers at: aKeyString put: aValueString
]

{ #category : #accessing }
WAEmailMessage >> headers [
	^ headers
]

{ #category : #initialization }
WAEmailMessage >> initialize [
	super initialize.
	to := OrderedCollection new.
	cc := OrderedCollection new.
	bcc := OrderedCollection new.
	headers := Dictionary new.
	self 
		headerAt: 'Date'
		put: (GRPrinter rfc822 print: DateAndTime now)
]

{ #category : #testing }
WAEmailMessage >> isMultipart [
	^ false
]

{ #category : #private }
WAEmailMessage >> plainMessage [
	^ String
		streamContents: [ :stream | 
			self renderAddress: self from withHeader: 'From: ' on: stream.
			self to do: [ :each |
				self renderAddress: each withHeader: 'To: ' on: stream ].
			self cc do: [ :each |
				self renderAddress: each withHeader: 'Cc: ' on: stream ].
			self bcc do: [ :each |
				self renderAddress: each withHeader: 'Bcc: ' on: stream ].
			stream
				nextPutAll: 'Subject: ';
				nextPutAll: self subject;
				nextPut: Character cr.
			self replyTo isNil ifFalse: [
				self renderAddress: self replyTo withHeader: 'Reply-To: ' on: stream ].
			self headers keysAndValuesDo: [ :key :value | 
				stream
					nextPutAll: key greaseString;
					nextPut: $:;
					nextPut: Character space;
					nextPutAll: value greaseString;
					nextPut: Character cr ].
			stream nextPut: Character cr.	"let body start"
			self writeBodyOn: stream ]
]

{ #category : #private }
WAEmailMessage >> recipients [
	^ self to , self cc , self bcc collect: [ :each | each greaseString ]
]

{ #category : #private }
WAEmailMessage >> recipientsAddresses [
	^ Array streamContents: [ :stream |
		self to do: [ :each |
			stream nextPut: each address ].
		self cc do: [ :each |
			stream nextPut: each address ].
		self bcc do: [ :each |
			stream nextPut: each address ] ]
]

{ #category : #private }
WAEmailMessage >> renderAddress: anEmailAddress withHeader: aString on: aStream [ 
	aStream
		nextPutAll: aString;
		nextPutAll: anEmailAddress greaseString;
		nextPut: Character cr
]

{ #category : #adding }
WAEmailMessage >> replyTo [
	^ replyTo
]

{ #category : #adding }
WAEmailMessage >> replyTo: anEmailAddress [
	replyTo := anEmailAddress
]

{ #category : #actions }
WAEmailMessage >> send [
	GRPlatform current seasideDeliverEmailMessage: self
]

{ #category : #convenience }
WAEmailMessage >> setStringBody: aString [
	self setStringBody: aString wrap: false
]

{ #category : #convenience }
WAEmailMessage >> setStringBody: aString wrap: aBoolean [
	self body: (aBoolean
		ifTrue: [ WAStringEmailBody string: aString lineLength: 80 ]
		ifFalse: [ WAStringEmailBody contentString: aString ])
]

{ #category : #accessing }
WAEmailMessage >> subject [
	^ subject
]

{ #category : #accessing }
WAEmailMessage >> subject: anObject [
	subject := anObject
]

{ #category : #accessing }
WAEmailMessage >> to [
	^ to
]

{ #category : #private }
WAEmailMessage >> writeBodyOn: stream [
	self body isNil
		ifFalse: [ stream nextPutAll: self body greaseString ]
]
