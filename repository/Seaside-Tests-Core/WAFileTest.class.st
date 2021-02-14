Class {
	#name : #WAFileTest,
	#superclass : #TestCase,
	#instVars : [
		'file'
	],
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #running }
WAFileTest >> setUp [
	file := WAFile new
]

{ #category : #tests }
WAFileTest >> testBorderline [
	file fileName: 'C'.
	self assert: file fileName = 'C'.
	file fileName: 'C:'.
	self assert: file fileName = 'C:'.
	file fileName: 'C:\'.
	self assert: file fileName = ''
]

{ #category : #tests }
WAFileTest >> testContentType [
	file contentType: 'text/plain'.
	self assert: file contentType = 'text/plain' seasideMimeType.
	
	file contentType: 'text/plain' seasideMimeType.
	self assert: file contentType = 'text/plain' seasideMimeType.

	file contentType: nil.
	self assert: file contentType isNil
]

{ #category : #tests }
WAFileTest >> testContents [
	file contents: #(83 101 97 115 105 100 101) asByteArray.
	self assert: file rawContents = #(83 101 97 115 105 100 101) asByteArray.
	self assert: (file contentsDecodedUsing: 'ISO-8859-1') = 'Seaside'
	
	
]

{ #category : #tests }
WAFileTest >> testContentsDecoded [
	file contents: #(83 101 97 115 105 100 101) asByteArray.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain'.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain; charset=iso-8859-1' seasideMimeType.
	self assert: file contentsDecoded = 'Seaside'
	
	
]

{ #category : #tests }
WAFileTest >> testNonLatinWindowsPath [
	| koreanName |
	"If the following assertion fails, your Smalltalk dialect most probably does not support non-latin characters. This is true for Squeak 3.7. If your Smalltalk dialect does support non-latin characters adjust the test."
	self shouldnt:  [
		koreanName := (String
			with: (Character codePoint: 50976)
			with: (Character codePoint: 47532)
			with: (Character codePoint: 47484)), '.txt' ]
		raise: Error.

	file fileName: koreanName.
	self assert: file fileName = koreanName.
	file fileName: 'C:\important\', koreanName.
	self assert: file fileName = koreanName
]

{ #category : #tests }
WAFileTest >> testWindowsPath [
	file fileName: 'C:\important\passwords.txt'.
	self assert: file fileName = 'passwords.txt'.
	file fileName: '/important/passwords.txt'.
	self assert: file fileName = '/important/passwords.txt'.
	file fileName: 'passwords.txt'.
	self assert: file fileName = 'passwords.txt'
]
