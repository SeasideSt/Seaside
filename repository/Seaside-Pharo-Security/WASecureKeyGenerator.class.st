"
I generate cryptographically secure pseudorandom key. I delegate to a random number generator.

It is important that I seed myself automatically on image start up. Otherwise if an image is saved and afterwards started twice all images generate the same random numbers. Also I must not use the system time for seeding as multiple images could be started at the same time. Currently seeding uses /dev/urandom and therefore is only available un Unix environments. If I can't successfully seed myself I install a key generator that always fails.
"
Class {
	#name : #WASecureKeyGenerator,
	#superclass : #WAKeyGenerator,
	#instVars : [
		'mutex'
	],
	#classInstVars : [
		'generator',
		'fortuna',
		'sha1'
	],
	#category : 'Seaside-Pharo-Security'
}

{ #category : #public }
WASecureKeyGenerator class >> beFortuna [
	generator := #fortuna
]

{ #category : #public }
WASecureKeyGenerator class >> beSha1 [
	generator := #sha1
]

{ #category : #private }
WASecureKeyGenerator class >> canSeed [
	^ GRPlatform current fileExists: self seedFile
]

{ #category : #public }
WASecureKeyGenerator class >> fortuna [
	^ fortuna
]

{ #category : #private }
WASecureKeyGenerator class >> generateKey: keySize [
	^ GRPlatform current fileStreamOn: self seedFile do:[ :stream | stream next: keySize] binary: true
]

{ #category : #public }
WASecureKeyGenerator class >> generator [
	^ self perform: generator
]

{ #category : #initialization }
WASecureKeyGenerator class >> initialize [
	GRPlatform current addToStartUpList: self.
	"in case seeding fails alway fail"
	self installFailing.
	self canSeed ifTrue: [
		self beSha1.
		self seed.
		self install ]
]

{ #category : #public }
WASecureKeyGenerator class >> install [
	WAKeyGenerator current: (self new
		generator: nil;
		yourself)
]

{ #category : #private }
WASecureKeyGenerator class >> installFailing [
	WAKeyGenerator current: WANoSecureKeyGeneratorAvailable new
]

{ #category : #private }
WASecureKeyGenerator class >> seed [
	fortuna := Fortuna key: (self generateKey: 32). "256 bits"
	sha1 := SecureRandom key: (self generateKey: 32)
]

{ #category : #private }
WASecureKeyGenerator class >> seedFile [
	^ '/dev/urandom'
]

{ #category : #public }
WASecureKeyGenerator class >> sha1 [
	^ sha1
]

{ #category : #'system startup' }
WASecureKeyGenerator class >> startUp [
	"in case seeding fails alway fail"
	self installFailing.
	self canSeed ifTrue: [
		self seed.
		self install ]
]

{ #category : #public }
WASecureKeyGenerator class >> uninstall [
	WAKeyGenerator current: WAKeyGenerator new.
	sha1 := nil.
	fortuna := nil
]

{ #category : #initialization }
WASecureKeyGenerator class >> unload [
	GRPlatform current removeFromStartUpList: self.
	self uninstall
]

{ #category : #initialization }
WASecureKeyGenerator >> initialize [
	super initialize.
	mutex := WAMutex new
]

{ #category : #public }
WASecureKeyGenerator >> keyOfLength: anInteger [
	^ mutex critical: [
		generator := self class generator.
		^ super keyOfLength: anInteger ]
]
