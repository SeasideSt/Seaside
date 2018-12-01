Class {
	#name : #WAEmailAddressTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #private }
WAEmailAddressTest >> render: anObject [
	^ WARenderer builder
		documentClass: WAHtmlDocument;
		render: anObject
]

{ #category : #tests }
WAEmailAddressTest >> testAddress [
	| address |
	address := WAEmailAddress address: 'philippe.marschall@gmail.com'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username isNil.
	self assert: address greaseString = 'philippe.marschall@gmail.com'
]

{ #category : #tests }
WAEmailAddressTest >> testAddressUsername [
	| address |
	address := WAEmailAddress 
		address: 'philippe.marschall@gmail.com'
		username: 'Philippe Marschall'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username = 'Philippe Marschall'.
	self assert: address greaseString = '"Philippe Marschall" <philippe.marschall@gmail.com>'
]

{ #category : #tests }
WAEmailAddressTest >> testEmpty [
	| address |
	address := WAEmailAddress address: (String 
			with: Character cr
			with: Character lf) , 'philippe.marschall@gmail.com'.
	self assert: address address = ''.
	self assert: address username isNil.
	self assert: address greaseString = ''
]

{ #category : #tests }
WAEmailAddressTest >> testGreaseString [
	| address |
	address := WAEmailAddress 
		address: 'philippe.marschall@gmail.com'
		username: 'Philippe Marschall'.
	self assert: address greaseString = '"Philippe Marschall" <philippe.marschall@gmail.com>'
]

{ #category : #tests }
WAEmailAddressTest >> testInjection [
	| address |
	address := WAEmailAddress address: 'philippe.marschall@gmail.com' , (String 
				with: Character cr
				with: Character lf) , 'Evil-Header: evil-value'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username isNil.
	self assert: address greaseString = 'philippe.marschall@gmail.com'
]

{ #category : #tests }
WAEmailAddressTest >> testRendering [
	| address |
	address := WAEmailAddress
		address: 'philippe.marschall@gmail.com'
		username: 'Philippe Marschall'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username = 'Philippe Marschall'.
	self assert: (self render: address) = 'Philippe Marschall &lt;philippe.marschall@gmail.com&gt;'
]
