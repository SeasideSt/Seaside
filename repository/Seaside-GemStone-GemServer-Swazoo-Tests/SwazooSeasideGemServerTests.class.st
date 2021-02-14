Class {
	#name : #SwazooSeasideGemServerTests,
	#superclass : #SeasideGemServerTests,
	#category : 'Seaside-GemStone-GemServer-Swazoo-Tests'
}

{ #category : #accessing }
SwazooSeasideGemServerTests >> gemServer [
  ^ SwazooSeasideGemServer register: self gemServerName
]

{ #category : #accessing }
SwazooSeasideGemServerTests >> gemServerName [
  ^ 'SwazooSeasideServer'
]
