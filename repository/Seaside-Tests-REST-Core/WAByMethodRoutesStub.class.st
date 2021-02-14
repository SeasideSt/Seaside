Class {
	#name : #WAByMethodRoutesStub,
	#superclass : #Object,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #accessing }
WAByMethodRoutesStub >> arguments [
	^ arguments
]

{ #category : #stubs }
WAByMethodRoutesStub >> compactDatabase: aString [
	selector := #compactDatabase:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> createBulkDocumentsInDatabase: aString [
	selector := #createBulkDocumentsInDatabase:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> createDatabase: aString [
	selector := #createDatabase:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> createNewDocumentInDatabase: aString [
	selector := #createNewDocumentInDatabase:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> createOrUpdateDocument: aFirstString inDatabase: aSecondString [
	selector := #createOrUpdateDocument:inDatabase:.
	arguments := Array with: aFirstString with: aSecondString
]

{ #category : #stubs }
WAByMethodRoutesStub >> deleteDatabase: aString [
	selector := #deleteDatabase:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> deleteDocument: aFirstString inDatabase: aSecondString [
	selector := #deleteDocument:inDatabase:.
	arguments := Array with: aFirstString with: aSecondString
]

{ #category : #stubs }
WAByMethodRoutesStub >> getAllDatabases [
	selector := #getAllDatabases.
	arguments := Array new
]

{ #category : #stubs }
WAByMethodRoutesStub >> getAllDocuments: aString [
	selector := #getAllDocuments:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> getConfig [
	selector := #getConfig.
	arguments := Array new
]

{ #category : #stubs }
WAByMethodRoutesStub >> getDatabase: aString [
	selector := #getDatabase:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> getDocument: aFirstString ofDatabase: aSecondString [
	selector := #getDocument:ofDatabase:.
	arguments := Array with: aFirstString with: aSecondString
]

{ #category : #stubs }
WAByMethodRoutesStub >> getInfo [
	selector := #getInfo.
	arguments := Array new
]

{ #category : #stubs }
WAByMethodRoutesStub >> getStats [
	selector := #getStats.
	arguments := Array new
]

{ #category : #stubs }
WAByMethodRoutesStub >> getUuids: aString [
	selector := #getUuids:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> getView: aFirstString inDesign: aSecondString inDatabase: aThirdString [
	selector := #getView:inDesign:inDatabase:.
	arguments := Array with: aFirstString with: aSecondString with: aThirdString
]

{ #category : #stubs }
WAByMethodRoutesStub >> queryDatabase: aString [
	selector := #queryDatabase:.
	arguments := Array with: aString
]

{ #category : #stubs }
WAByMethodRoutesStub >> replicate [
	selector := #replicate.
	arguments := Array new
]

{ #category : #accessing }
WAByMethodRoutesStub >> selector [
	^ selector
]
