Class {
	#name : #WASecureKeyGeneratorTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Pharo-Security'
}

{ #category : #running }
WASecureKeyGeneratorTest >> defaultTimeout [
	"Increase timeout on Squeak."

	^ 20 "seconds"
]

{ #category : #private }
WASecureKeyGeneratorTest >> runGeneratorTest [
	WAKeyGeneratorTest new testUnique
]

{ #category : #testing }
WASecureKeyGeneratorTest >> testInstallation [
	self assert: WASecureKeyGenerator canSeed.
	self assert: (WAKeyGenerator current isKindOf: WASecureKeyGenerator)
]

{ #category : #testing }
WASecureKeyGeneratorTest >> testSha1 [
	[ WASecureKeyGenerator beFortuna.
	self runGeneratorTest ]
		ensure: [ WASecureKeyGenerator beSha1 ]
]
