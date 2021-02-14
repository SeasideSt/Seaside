Class {
	#name : #ZnSeasideNewGemServerTests,
	#superclass : #ZnSeasideGemServerTests,
	#category : 'Seaside-GemStone-GemServer-Tests'
}

{ #category : #private }
ZnSeasideNewGemServerTests class >> setDebugMode: gemServer [
  gemServer debugMode: true
]

{ #category : #Testing }
ZnSeasideNewGemServerTests class >> shouldInheritSelectors [
  "I should inherit from an Abstract superclass but not from a concrete one by default, unless I have no testSelectors in which case I must be expecting to inherit them from my superclass.  If a test case with selectors wants to inherit selectors from a concrete superclass, override this to true in that subclass."

  ^ true
]

{ #category : #accessing }
ZnSeasideNewGemServerTests >> gemServer [
  "ZnSeasideNewGemServerTests staticRemoteServer: true.
   ZnSeasideNewGemServerTests interactiveRemoteServer: true.

   ZnSeasideNewGemServerTests staticRemoteServer: false.
   ZnSeasideNewGemServerTests interactiveRemoteServer: false."

  "mount @/sys/stone/dirs/Seaside3/tode /home seaside3"

  "abort; /home/seaside3/gemServer --interactiveStart=ZnSeasideServer"

  "limit autoCommit false; eval `System transactionMode: #manualBegin` /home/seaside3/gemServer --interactiveStart=ZnSeasideServer"

  | gemServer |
  gemServer := ZnSeasideNewGemServer register: self gemServerName.
  self interactiveRemoteServer
    ifTrue: [ gemServer interactiveMode: true ].
  ^ gemServer
]

{ #category : #private }
ZnSeasideNewGemServerTests >> setDebugMode: gemServer [
  gemServer interactiveMode: true
]
