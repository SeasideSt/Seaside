Class {
	#name : #WAAttributeVisitor,
	#superclass : #WAVisitor,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAAttributeVisitor >> visitAttribute: anAttribute [
]

{ #category : #visiting }
WAAttributeVisitor >> visitBooleanAttribute: anAttribute [
	self visitAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitClassBindingAttribute: anAttribute [
	self visitListAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitClassBindingCollectionAttribute: anAttribute [
	self visitListAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitClassListAttribute: anAttribute [
	self visitListAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitCollectionAttribute: anAttribute [
	self visitListAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitIntegerAttribute: anAttribute [
	self visitNumberAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitListAttribute: anAttribute [
	self visitAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitNumberAttribute: anAttribute [
	self visitAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitPasswordAttribute: anAttribute [
	self visitAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitStringAttribute: anAttribute [
	self visitAttribute: anAttribute
]

{ #category : #visiting }
WAAttributeVisitor >> visitUrlAttribute: anAttribute [
	self visitAttribute: anAttribute
]
