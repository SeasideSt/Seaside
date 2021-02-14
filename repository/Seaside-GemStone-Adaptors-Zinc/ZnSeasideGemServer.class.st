Class {
	#name : #ZnSeasideGemServer,
	#superclass : #ZnGemServer,
	#instVars : [
		'maintenanceVm'
	],
	#category : 'Seaside-GemStone-Adaptors-Zinc'
}

{ #category : #accessing }
ZnSeasideGemServer class >> serverClass [
  ^ WAGsZincAdaptor
]

{ #category : #initialization }
ZnSeasideGemServer >> delegate: aZnDelegate [
  "delegate is managed by the adaptor"

  self shouldNotImplement
]

{ #category : #initialization }
ZnSeasideGemServer >> initialize [
  | vmName |
  super initialize.
  vmName := self defaultMaintenanceVmName.
  self
    maintenanceVm:
      ((self class gemServerNamed: vmName)
        ifNil: [ MaintenanceVmGemServer register: vmName ])
]

{ #category : #accessing }
ZnSeasideGemServer >> maintenanceVm [

   ^maintenanceVm
]

{ #category : #accessing }
ZnSeasideGemServer >> maintenanceVm: anObject [

   maintenanceVm := anObject
]

{ #category : #'service instance-server' }
ZnSeasideGemServer >> startBasicServerOn: port [
  "start instance of seaside adaptor. expected to return."

  | adaptor znServer |
  GRPlatform current seasideLogServerStart: self class name port: port.
  adaptor := self serverClass port: port.
  self serverInstance: adaptor.
  adaptor server
    debugMode: self debugMode;
    log: self log;
    yourself.
  adaptor gemServerStart
]

{ #category : #'service instance-control' }
ZnSeasideGemServer >> startGems [
  super startGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer startGems ]
]

{ #category : #'service instance-control' }
ZnSeasideGemServer >> statusGems [
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
ZnSeasideGemServer >> stopGems [
  super stopGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer stopGems ]
]
