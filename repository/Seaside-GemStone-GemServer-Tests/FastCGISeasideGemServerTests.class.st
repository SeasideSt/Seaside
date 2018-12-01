Class {
	#name : #FastCGISeasideGemServerTests,
	#superclass : #SeasideGemServerTests,
	#category : 'Seaside-GemStone-GemServer-Tests'
}

{ #category : #accessing }
FastCGISeasideGemServerTests >> gemServer [
  ^ FastCGISeasideGemServer register: self gemServerName
]

{ #category : #accessing }
FastCGISeasideGemServerTests >> gemServerName [
  ^ 'FastCGISeasideServer'
]

{ #category : #testing }
FastCGISeasideGemServerTests >> hasHttpClient [
  "no FastCGI client"

  ^ false
]
