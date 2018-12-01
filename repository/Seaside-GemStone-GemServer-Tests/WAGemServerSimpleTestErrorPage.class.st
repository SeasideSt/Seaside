Class {
	#name : #WAGemServerSimpleTestErrorPage,
	#superclass : #WAComponent,
	#category : 'Seaside-GemStone-GemServer-Tests'
}

{ #category : #initialization }
WAGemServerSimpleTestErrorPage class >> initialize [
  "self initialize"

  self initializeWithErrorHandler: WAGemStoneWalkbackErrorHandler
]

{ #category : #initialization }
WAGemServerSimpleTestErrorPage class >> initializeWithErrorHandler: exceptionHandlerClass [
  "self initialize"

  | application filter attribute |
  (application := WAAdmin register: self asApplicationAt: 'tests/gemServerError')
    preferenceAt: #'sessionClass'
    put: WASession.
  filter := WAExceptionFilter new.
  attribute := filter configuration attributeAt: #'exceptionHandler'.
  filter configuration takeValue: exceptionHandlerClass forAttribute: attribute.
  application addFilter: filter
]

{ #category : #rendering }
WAGemServerSimpleTestErrorPage >> renderContentOn: html [
  "error during render phase"

  self error: 'Test GemServer Error'
]
