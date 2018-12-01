Class {
	#name : #ZnSeasideNewGemServer,
	#superclass : #ZnNewGemServer,
	#instVars : [
		'maintenanceVm'
	],
	#category : 'Seaside-GemStone-Adaptors-Zinc'
}

{ #category : #accessing }
ZnSeasideNewGemServer class >> serverClass [
  ^ WAZincNewGemServerAdaptor
]

{ #category : #'service instance-server' }
ZnSeasideNewGemServer >> basicServerOn: port [
  "forked by caller"

  | adaptor znServer |
  adaptor := self serverInstance.
  znServer := adaptor server.
  znServer
    gemServer: self;
    port: port;
    gemServerOptions: self options;
    yourself.
  znServer initializeServerSocket.
  [ 
  [ 
  self
    gemServer: [ 
      znServer serverSocket isValid
        ifTrue: [ znServer serveConnectionsOn: znServer serverSocket ] ]
    beforeUnwind: [ :ex | ex pass ] ]
    repeat ]
    ifCurtailed: [ znServer releaseServerSocket ]
]

{ #category : #initialization }
ZnSeasideNewGemServer >> delegate: aZnDelegate [
  "delegate is managed by the adaptor"

  self shouldNotImplement
]

{ #category : #initialization }
ZnSeasideNewGemServer >> initialize [
  | vmName |
  super initialize.
  vmName := self defaultMaintenanceVmName.
  self
    maintenanceVm:
      ((self class gemServerNamed: vmName)
        ifNil: [ MaintenanceVmGemServer register: vmName ])
]

{ #category : #accessing }
ZnSeasideNewGemServer >> maintenanceVm [

   ^maintenanceVm
]

{ #category : #accessing }
ZnSeasideNewGemServer >> maintenanceVm: anObject [

   maintenanceVm := anObject
]

{ #category : #'service instance-server' }
ZnSeasideNewGemServer >> startBasicServerOn: port [
  "start instance of seaside adaptor. expected to return."

  | adaptor znServer |
  GRPlatform current seasideLogServerStart: self class name port: port.
  adaptor := self serverClass port: port.
  self serverInstance: adaptor.
  self
    basicServerProcess:
      ([ self basicServerOn: port ] forkAt: Processor highIOPriority)
]

{ #category : #'service instance-control' }
ZnSeasideNewGemServer >> startGems [
  super startGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer startGems ]
]

{ #category : #'service instance-control' }
ZnSeasideNewGemServer >> statusGems [
  | status |
  status := super statusGems.
  self maintenanceVm
    ifNotNil: [ :gemServer | 
      | maintStatus |
      maintStatus := gemServer statusGems.
      status := status , (maintStatus lines at: 2) ].
  ^ status
]

{ #category : #'service instance-control' }
ZnSeasideNewGemServer >> stopGems [
  super stopGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer stopGems ]
]
