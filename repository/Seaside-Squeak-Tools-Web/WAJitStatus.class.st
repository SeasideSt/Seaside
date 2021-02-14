"
A WAJitStatus displays information about the Just-In-Time native code compiler.
"
Class {
	#name : #WAJitStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Squeak-Tools-Web'
}

{ #category : #testing }
WAJitStatus >> isSupported [
	^ self isRunningCog
]

{ #category : #accessing }
WAJitStatus >> label [
	^ 'JIT'
]

{ #category : #accessing }
WAJitStatus >> priority [
	^ 400
]

{ #category : #rendering }
WAJitStatus >> renderCogValuesOn: html [

	self
		renderLabel: 'Size of machine code zone'
		value:  (self printMemory: (self image vmParameterAt: 46)) on: html.
	self
		renderLabel: 'Desired size of machine code zone'
		value:  (self printMemory: (self image vmParameterAt: 47)) on: html.
	
	self
		renderLabel: 'Compiled code compactions since startup'
		value: (self image vmParameterAt: 62) on: html.
	self
		renderLabel: 'Time spent on compiled code compactions since startup'
		value: (self  printMilliSeconds: (self image vmParameterAt: 63)) on: html
]

{ #category : #rendering }
WAJitStatus >> renderValuesOn: html [
	"Only Cog values supported"
]

{ #category : #accessing }
WAJitStatus >> title [
	^ 'Cog Just-In-Time Compiler'
]
