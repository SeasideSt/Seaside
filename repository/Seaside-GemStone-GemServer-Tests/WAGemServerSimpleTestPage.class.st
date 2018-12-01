Class {
	#name : #WAGemServerSimpleTestPage,
	#superclass : #WAComponent,
	#category : 'Seaside-GemStone-GemServer-Tests'
}

{ #category : #initialization }
WAGemServerSimpleTestPage class >> initialize [
  "self initialize"

  (WAAdmin register: self asApplicationAt: 'tests/gemServerSimple')
    preferenceAt: #'sessionClass'
    put: WASession
]

{ #category : #rendering }
WAGemServerSimpleTestPage >> renderContentOn: html [
  html heading: 'Simple HTML page'.
  html text: 'Just a simple page.'
]
