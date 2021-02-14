"
I represent the JSON object (www.json.org) that is supported by most modern web browsers. For older browsers I require WAJsonDeploymentLibrary or WAJsonDevelopmentLibrary to be included.
"
Class {
	#name : #JSJson,
	#superclass : #JSObject,
	#category : 'Javascript-Core-Base'
}

{ #category : #printing }
JSJson >> javascriptContentOn: aStream [
	aStream nextPutAll: 'JSON'
]

{ #category : #accessing }
JSJson >> parse: aString [
	"This method parses a JSON text to produce an object or array."

	self call: 'parse' with: aString
]

{ #category : #accessing }
JSJson >> parse: aString reviver: aFunction [ 
	"This method parses a JSON text to produce an object or array. The optional reviver parameter is a function that can filter and transform the results. It receives each of the keys and values, and its return value is used instead of the original value. If it returns what it received, then the structure is not modified. If it returns undefined then the member is deleted."

	self call: 'parse' with: aString with: aFunction asFunction
]

{ #category : #accessing }
JSJson >> stringify: anObject [
	"Serialize anObject as a JSON string."

	self call: 'stringify' with: anObject
]

{ #category : #accessing }
JSJson >> stringify: anObject replacer: aReplacer [
	"Serialize anObject as a JSON string. aReplacer is an optional parameter that determines how object values are stringified for objects. It can be a function or an array of strings."

	self call: 'stringify' with: anObject with: aReplacer
]

{ #category : #accessing }
JSJson >> stringify: anObject replacer: aReplacer space: aSpace [
	"Serialize anObject as a JSON string. aReplacer is an optional parameter that determines how object values are stringified for objects. It can be a function or an array of strings. aSpace is an optional parameter that specifies the indentation of nested structures. If it is omitted, the text will be packed without extra whitespace."

	self call: 'stringify' with: anObject with: aReplacer with: aSpace
]

{ #category : #accessing }
JSJson >> stringify: anObject space: aSpace [
	"Serialize anObject as a JSON string. aSpace is an optional parameter that specifies the indentation of nested structures. If it is omitted, the text will be packed without extra whitespace."

	self call: 'stringify' with: anObject with: aSpace
]
