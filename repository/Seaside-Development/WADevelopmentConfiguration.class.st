Class {
	#name : #WADevelopmentConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Development-Core'
}

{ #category : #initialization }
WADevelopmentConfiguration class >> initialize [
	WAAdmin applicationDefaults addParent: self instance
]

{ #category : #description }
WADevelopmentConfiguration >> describeOn: config [
	config at: #rootDecorationClasses addAll: (Array with: (GRPlatform current bindingOf: WAToolDecoration))
]

{ #category : #ancestry }
WADevelopmentConfiguration >> parents [
	^ Array with: WARenderLoopConfiguration instance
]
