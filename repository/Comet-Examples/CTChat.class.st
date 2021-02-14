Class {
	#name : #CTChat,
	#superclass : #WAComponent,
	#classInstVars : [
		'pusher'
	],
	#category : 'Comet-Examples'
}

{ #category : #initialization }
CTChat class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'comet/chat'.
	application preferenceAt: #sessionClass put: CTChatSession.
	application
		addLibrary: JQDeploymentLibrary;
		addLibrary: CTLibrary
]

{ #category : #accessing }
CTChat class >> pusher [
	^ pusher ifNil: [ pusher := CTPusher new ]
]

{ #category : #testing }
CTChat >> isLoggedIn [
	^ self username notNil
]

{ #category : #actions }
CTChat >> login: aString [
	"Join the chat-room with the given username aString."
	
	aString isEmptyOrNil ifTrue: [ ^ self ].
	self session username: aString.
	self push: 'event' with: 'joined'
]

{ #category : #actions }
CTChat >> logout [
	"Leave the chat-room."

	self push: 'event' with: 'left'.
	self session username: nil
]

{ #category : #actions }
CTChat >> message: aString [
	"Send the message aString to the chat-room."
	
	self push: 'message' with: aString
]

{ #category : #private }
CTChat >> push: aString with: aBlock [
	"This code pushes the new message to all its clients. With the exception of part 2 adding the message itself, all other parts are optional."
	
	self pusher javascript: [ :script |
		script add: ((script jQuery: #messages)
		"1. limit listing to 20 messages"
			children;
			sliceFrom: 0 to: -19;
			remove;
			end;
		"2. append message to bottom"
			append: [ :html | self renderMessage: aBlock class: aString on: html ];
			end;
		"3. scroll to bottom"
			scrollTop: 65536) ]
]

{ #category : #accessing }
CTChat >> pusher [
	^ self class pusher
]

{ #category : #'rendering-chat' }
CTChat >> renderChatInputOn: html [
	html form
		onSubmit: (html jQuery ajax
			onSuccess: ((html jQuery: #input) 
				value: String new;
				triggerFocus);
			serializeForm;
			return: false);
		with: [
			html textInput
				id: #input;
				callback: [ :value | self message: value ] ]
]

{ #category : #'rendering-chat' }
CTChat >> renderChatMessagesOn: html [
	html div id: 'messages'; with: [
		self 
			renderMessage: [
				self users isEmpty
					ifTrue: [ html text: 'You are the only one here!' ]
					ifFalse: [
						html text: 'Also there: '.
						self users
							do: [ :each | html text: each ]
							separatedBy: [ html text: ', ' ] ] ]
			class: 'event' on: html ]
]

{ #category : #rendering }
CTChat >> renderChatOn: html [
	self renderChatStatusOn: html.
	self renderChatMessagesOn: html.
	self renderChatInputOn: html.
	self renderChatPusherOn: html
]

{ #category : #'rendering-chat' }
CTChat >> renderChatPusherOn: html [
	html document 
		addLoadScript: (html comet
			pusher: self pusher;
			connect)
]

{ #category : #'rendering-chat' }
CTChat >> renderChatStatusOn: html [
	html div id: 'status'; with: [
		html text: 'Currently logged in as ' , self username , '. '.
		html anchor
			callback: [ self logout ];
			with: 'Logout' ]
]

{ #category : #rendering }
CTChat >> renderContentOn: html [
	html heading: 'Seaside Chat'.
	self isLoggedIn
		ifTrue: [ self renderChatOn: html ]
		ifFalse: [ self renderLoginOn: html ]
]

{ #category : #rendering }
CTChat >> renderLoginOn: html [
	html form: [
		html textInput
			value: self username;
			callback: [ :value | self login: value ].
		html submitButton
			text: 'Login' ]
]

{ #category : #rendering }
CTChat >> renderMessage: aBlock class: aString on: html [
	html div class: 'message'; with: [
		html span class: 'user'; with: self username.
		html span class: aString; with: aBlock ]
]

{ #category : #hooks }
CTChat >> style [
	^ 'a {
	color: #00f;
	cursor: pointer;
	text-decoration: underline;	
}
#status {
	background-color: #eee;
}
#messages {
	height: 10em;
	overflow: auto;
}
#messages .message {
	margin-top: 0.25em;
	margin-bottom: 0.25em;
}
#messages .message .user {
	font-weight: bold;
	margin-right: 1em;
}
#messages .message .event {
	font-style: italic;
}
#input {
	width: 100%;
	background-color: #eee;
}'
]

{ #category : #accessing }
CTChat >> username [
	^ self session username
]

{ #category : #accessing }
CTChat >> users [
	^ (self pusher handlers
		reject: [ :each | self session == each session or: [ each session username isNil ] ])
		collect: [ :each | each session username ]
]
