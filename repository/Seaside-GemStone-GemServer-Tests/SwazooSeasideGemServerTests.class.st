Class {
	#name : #SwazooSeasideGemServerTests,
	#superclass : #SeasideGemServerTests,
	#category : 'Seaside-GemStone-GemServer-Tests'
}

{ #category : #accessing }
SwazooSeasideGemServerTests >> gemServer [
  ^ SwazooSeasideGemServer register: self gemServerName
]

{ #category : #accessing }
SwazooSeasideGemServerTests >> gemServerName [
  ^ 'SwazooSeasideServer'
]
