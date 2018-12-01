"
I am the common superclass for all classes that provided connectivity with the Comanche web server (Kom). Among other thing I do encoding and decoding of requests and responses. I have two main subclasses, WAComancheAdaptor is a traditional server adapter whereas WAListener is a streaming server adapter that proves Comet functionality. When in doubt, pick WAComancheAdaptor.

The encoding can be configured with the #endocing: method. The following values are allowed arguments:
nil
	switches off all encoding
	Strings will be delivered to you in the encoding the client used as ByteStrings. You can configure the encoding of these strings with the #charSet setting of your application. All Strings you return must have this encoding as well.
	
'utf-8'
	uses the utf-8 fast path by Andreas Raab
	Strings will be delivered to you as Squeak encoded Strings (minus the leading char). All the Strings you return must as well be Squeak encoded. Responses send to the client will be utf-8 encoded. You must additionally set the #charSet setting of your application to 'utf-8' (should be the default).
	
any other encoding supported by Squeak, see TextConverter allEncodingNames
	uses whatever TextConverter Squeak uses for this encoding
	Strings will be delivered to you as Squeak encoded Strings (minus the leading character). All the Strings you return must as well be Squeak encoded. Responses send to the client will be in the specified encoding. You must additionally set the #charSet setting of your application to the desired value.
"
Class {
	#name : #WAComancheRequestConverter,
	#superclass : #WAServerAdaptor,
	#instVars : [
		'streamUploads'
	],
	#category : 'Seaside-Adaptors-Comanche'
}

{ #category : #testing }
WAComancheRequestConverter class >> isAbstract [
	^ self name = #WAComancheRequestConverter
]

{ #category : #'accessing-readonly' }
WAComancheRequestConverter >> additionalStatusOn: aStream [
	aStream nextPutAll: 'Stream uploads: '; nextPutAll: streamUploads greaseString; nextPut: Character cr
]

{ #category : #private }
WAComancheRequestConverter >> convertMultipartFileField: aChunk [
	^ (self fileClass fromChunk: aChunk)
		fileName: (self codec url decode: aChunk fileName);
		yourself
]

{ #category : #private }
WAComancheRequestConverter >> decodeFields: aDictionary using: aOneArgumentBlock into: aRequestFields [
	aDictionary keysAndValuesDo: [ :key :value |
		value isString
			ifTrue: [ aRequestFields at: key add: (aOneArgumentBlock value: value) ]
			ifFalse: [
				(value isCollection)
					ifTrue: [ value do: [ :string |
						aRequestFields at: key add: (aOneArgumentBlock value: string) ] ]
					ifFalse: [ aRequestFields at: key add: value ] ] ]
]

{ #category : #private }
WAComancheRequestConverter >> fileClass [
	^ streamUploads
		ifTrue: [ WATemporaryFile ]
		ifFalse: [ WAFile ]
]

{ #category : #initialization }
WAComancheRequestConverter >> initialize [
	super initialize.
	streamUploads := false
]

{ #category : #private }
WAComancheRequestConverter >> isUrlEncoded: aNativeRequest [
	"answers whether the body of the given request is url encoded"

	^ aNativeRequest contentType = 'application/x-www-form-urlencoded'
]

{ #category : #private }
WAComancheRequestConverter >> postFieldsOf: aNativeRequest into: aRequestFields [
	"puts all the POST parameters of the given request decoded into a WARequestFields"
	| isUrlEncoded |
	isUrlEncoded := self isUrlEncoded: aNativeRequest.
	^ self
		decodeFields: aNativeRequest postFields
		using: [ :each |
			isUrlEncoded 
				ifTrue: [ self codec url decode: each ]
				ifFalse: [ self codec decode: each ] ]
		into: aRequestFields
]

{ #category : #private }
WAComancheRequestConverter >> processMultipartFields: aKomRequest [
	| fields |
	fields := WARequestFields new.	

	aKomRequest multipartFormFieldsDo: [ :chunk |
		| key value |
		key := chunk fieldName.
		value := chunk fileName isEmptyOrNil
			ifTrue: [
				String streamContents: [ :stream |
					chunk saveToStream: stream ] ]
			ifFalse: [ self convertMultipartFileField: chunk ].
		fields at: key add: value ].
	
	"ugly"
	aKomRequest propertyAt: #postFields put: fields
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestAddressFor: aNativeRequest [
	| remoteAddress |
	remoteAddress := aNativeRequest remoteAddress.
	remoteAddress isString
		ifTrue: [ ^ remoteAddress ].
	^ String streamContents: [ :stream |
		remoteAddress
			do: [ :each | stream print: each ]
			separatedBy: [ stream nextPut: $. ] ]
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestBodyFor: aNativeRequest [
	
	^ aNativeRequest rawRequestContents
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestCookiesFor: aNativeRequest [
	^ WARequestCookie fromString: (aNativeRequest header at: 'cookie' ifAbsent: [ nil ]) codec: self codec
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestFieldsFor: aNativeRequest [
	| fields |
	fields := WARequestFields new.
	aNativeRequest isPostRequest
		ifTrue: [ self postFieldsOf: aNativeRequest into: fields ].
	^ fields
]

{ #category : #converting }
WAComancheRequestConverter >> requestFor: aNativeRequest [
	aNativeRequest multiValueFormFieldsEnable.
	aNativeRequest isPostMultipart 
		ifTrue: [ self processMultipartFields: aNativeRequest ].
	^ super requestFor: aNativeRequest
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestHeadersFor: aNativeRequest [
	^ aNativeRequest header
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestMethodFor: aNativeRequest [
	^ aNativeRequest method
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestUrlFor: aNativeRequest [
	^ (WAUrl absolute: aNativeRequest rawUrl)
		decodedWith: self codec
]

{ #category : #'converting-request' }
WAComancheRequestConverter >> requestVersionFor: aNativeRequest [
	^ WAHttpVersion fromString: aNativeRequest protocol
]

{ #category : #accessing }
WAComancheRequestConverter >> streamUploads [
	^ streamUploads
	
]

{ #category : #accessing }
WAComancheRequestConverter >> streamUploads: aBoolean [
	"Enables or disables upload streaming. If set to true, then all file uploads will be written to a temporary file."

	streamUploads := aBoolean
	
]
