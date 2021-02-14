"
A WAVirtualMachineStatus displays information about the virtual machine that runs this image.
"
Class {
	#name : #WAVirtualMachineStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #accessing }
WAVirtualMachineStatus >> label [
	^ 'VM'
]

{ #category : #accessing }
WAVirtualMachineStatus >> priority [
	^ 300
]

{ #category : #rendering }
WAVirtualMachineStatus >> renderCogValuesOn: html [
	self renderLabel: 'Cog VM - Interpreter' value: (self vm getSystemAttribute: 1007) on: html.
	self renderLabel: 'Cog VM - JIT' value: (self vm getSystemAttribute: 1008) on: html.
	self renderLabel: 'Cog VM - Stack pages' value: (self vm parameterAt: 42) on: html.
	self renderLabel: 'Cog VM - Desired stack pages' value: (self vm parameterAt: 43) on: html.
	"unclear which way round things go - and all appear to be zero anyway"
	"self renderLabel: 'Cog VM - bit 0' value: ((vm parameterAt: 48) bitAt: 1) on: html.
	self renderLabel: 'Cog VM - Interpreted method bit used?' value: ((vm parameterAt: 48) bitAt: 2) on: html.
	self renderLabel: 'Cog VM - preempted methods go to back of queue?' value: ((vm parameterAt: 48) bitAt: 3) on: html."
	self renderLabel: 'Cog VM - ForceInterruptChecks since startup' value: (self vm parameterAt: 58) on: html.
	self renderLabel: 'Cog VM - Stack page overflows since startup' value: (self vm parameterAt: 60) on: html.
	self renderLabel: 'Cog VM - Stack page divorces since startup' value: (self vm parameterAt: 61) on: html


]

{ #category : #rendering }
WAVirtualMachineStatus >> renderValuesOn: html [
	self renderLabel: 'VM Version' value: (self image vm getSystemAttribute: 1004) on: html.
	self renderLabel: 'VM Type' value: ((self image vm parameterAt: 40) * 8) printString, 'bit' on: html.
	self renderLabel: 'Endianness' value: (Smalltalk at: #EndianDetector ifAbsent:[ self image ]) endianness on: html.
	
	self renderLabel: 'Image Path' value: (self image vm getSystemAttribute: 1) on: html.
	
	self renderLabel: 'Document to Open' value: (self image vm getSystemAttribute: 2) on: html.
	self renderLabel: 'VM Options' value: (self vmOptionsFrom: self image) on: html.
	
	self renderLabel: 'Command Line Arguments' value: (self commandLineArgumentsFrom: self image) on: html.
	self
		renderLabel: 'Builtin Modules'
		value: [
			html unorderedList list: ((self image vm respondsTo: #listBuiltinModules) ifTrue: [ self image vm listBuiltinModules ] ifFalse: [ self image listBuiltinModules ]) ]
		on: html.
	self
		renderLabel: 'Loaded Modules'
		value: [
			html unorderedList list: ((self image vm respondsTo: #listLoadedModules) ifTrue:[ self image vm listLoadedModules ] ifFalse: [ self image listLoadedModules ]) ]
		on: html
]

{ #category : #accessing }
WAVirtualMachineStatus >> title [
	^ 'Virtual Machine'
]
