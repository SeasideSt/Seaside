"
I represent a file that was uploaded by the user via #fileInput.

Instance Variables
	contents:		<ByteArray>
	contentType:	<WAMimeType>
	fileName:		<String>

contents
	- the contents of the file, binary

contentType
	- the content type of the file
	
fileName
	- The name of the file the user agent uploaded. This is locale name on the machine of the client. The instance variable might include the full path on the file system, the accessor will never return the path.
"
Class {
	#name : #WAFile,
	#superclass : #WAObject,
	#instVars : [
		'contents',
		'contentType',
		'fileName'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #accessing }
WAFile >> contentType [
	^ contentType
]

{ #category : #accessing }
WAFile >> contentType: aMimeTypeOrString [
	contentType := aMimeTypeOrString isNil
		ifFalse: [ aMimeTypeOrString seasideMimeType ]
]

{ #category : #accessing }
WAFile >> contents: aByteArray [
	contents := aByteArray
]

{ #category : #accessing }
WAFile >> contentsDecoded [
	"Answer the contents decoded using the character set in the part header. Signal an error if not character set is present in the part header."
	| type charSet |
	type := self contentType.
	charSet := type isNil ifFalse: [ type charSet ].
	^ charSet isNil
		ifTrue: [ WAIllegalStateException signal: 'no character set of file upload can not be determined' ]
		ifFalse: [ self contentsDecodedUsing: charSet ]
]

{ #category : #accessing }
WAFile >> contentsDecodedUsing: aCharSetName [
	"Answer the contents decoded using the given character set name."
	^ (GRCodec forEncoding: aCharSetName) decode: self rawContents
]

{ #category : #accessing }
WAFile >> fileName [
	"compensate for windows explorer behavior"
	^ self isWindowsPath
		ifTrue: [ fileName copyAfterLast: $\ ]
		ifFalse: [ fileName ]
]

{ #category : #accessing }
WAFile >> fileName: aString [
	fileName := aString
]

{ #category : #private }
WAFile >> isWindowsPath [
	"'#:\*' match: fileName is broken on Squeak for WideString arguments"
	^ fileName notEmpty
		and: [ fileName first isLetter
		and: [ fileName size >= 3
		and: [ (fileName copyFrom: 2 to: 3) = ':\' ] ] ]
]

{ #category : #accessing }
WAFile >> rawContents [
	"Answer the raw, undecoded contents as sent by the user agent as a ByteArray.
	
	Use #contentsDecoded or #contentsDecodeUsing: to access the decoded contents."
	
	^ contents
]

{ #category : #accessing }
WAFile >> size [
	"the file size in bytes"

	^ self rawContents size
]
