Class {
	#name : #WAServerManagerNode,
	#superclass : #WANode,
	#instVars : [
		'manager'
	],
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #'instance creation' }
WAServerManagerNode class >> on: aServerManager [
	^ self basicNew initializeWithManager: aServerManager; yourself
]

{ #category : #accessing }
WAServerManagerNode >> adaptors [
	^ (manager adaptors asSortedCollection: [ :a :b | a port < b port ]) collect: [ :each | each asNode ]
]

{ #category : #initialization }
WAServerManagerNode >> initializeWithManager: aServerManager [
	manager := aServerManager
]

{ #category : #public }
WAServerManagerNode >> name [
	^ 'Server Manager'
]

{ #category : #updating }
WAServerManagerNode >> startAll [
	manager startAll
]

{ #category : #updating }
WAServerManagerNode >> stopAll [
	manager stopAll
]
