"
I never generate a key, I always signal an error. I am used as a random key generator when a secure key generator has been installed but could not be seeded. We would rather not generate a key than silently generate insecure ones.
"
Class {
	#name : #WANoSecureKeyGeneratorAvailable,
	#superclass : #WAKeyGenerator,
	#category : 'Seaside-Pharo-Security'
}

{ #category : #public }
WANoSecureKeyGeneratorAvailable >> keyOfLength: anInteger [
	self error: 'no secure key generator availble because seeding failed'
]
