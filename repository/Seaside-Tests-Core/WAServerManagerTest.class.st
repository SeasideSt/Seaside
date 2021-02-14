Class {
	#name : #WAServerManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'adaptor',
		'manager'
	],
	#category : 'Seaside-Tests-Core-Server'
}

{ #category : #private }
WAServerManagerTest >> availablePort [
	"This method should always return an unused port for the server manager"
	
	^ (manager adaptors collect: [ :each | each port ]) asSet max + 1
		
	

]

{ #category : #running }
WAServerManagerTest >> setUp [
	super setUp.
	manager := WAServerManager new.
	adaptor := WATestServerAdaptor manager: manager.
	adaptor port: 12345.
	adaptor running.
	self assert: adaptor isRunning.
	self assert: (manager adaptors includes: adaptor)

]

{ #category : #running }
WAServerManagerTest >> tearDown [
	super tearDown.
	adaptor stopped.
	self assert: adaptor isStopped.
	manager unregister: adaptor.
	self deny: (manager adaptors includes: adaptor)


]

{ #category : #tests }
WAServerManagerTest >> testCanStartWithAvailablePort [
	| adaptor1 |
	adaptor starting.
	self deny: (manager canStart: adaptor).
	adaptor running.
	self deny: (manager canStart: adaptor).
	adaptor stopping.
	self deny: (manager canStart: adaptor).
	adaptor stopped.
	self assert: (manager canStart: adaptor).
	
	adaptor1 := WATestServerAdaptor manager: manager.
	adaptor1 port: adaptor port.
	adaptor1 stopped.
	self assert: (manager canStart: adaptor1)
	
]

{ #category : #tests }
WAServerManagerTest >> testCanStartWithUnavailablePort [
	| adaptor1 |
	adaptor1 := WATestServerAdaptor manager: manager.
	adaptor1 port: adaptor port.
	adaptor1 starting.
	self deny: (manager canStart: adaptor1).
	adaptor1 running.
	self deny: (manager canStart: adaptor1).
	adaptor1 stopping.
	self deny: (manager canStart: adaptor1).
	adaptor1 stopped.
	self deny: (manager canStart: adaptor1)
	

]

{ #category : #tests }
WAServerManagerTest >> testCanStop [

	adaptor starting.
	self assert: (manager canStop: adaptor).
	adaptor running.
	self assert: (manager canStop: adaptor).
	adaptor stopping.
	self assert: (manager canStop: adaptor).
	adaptor stopped.
	self deny: (manager canStop: adaptor)
]
