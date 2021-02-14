Class {
	#name : #SeasideGemServer,
	#superclass : #GemServer,
	#instVars : [
		'maintenanceVm'
	],
	#category : 'Seaside-GemStone-GemServer-Core'
}

{ #category : #initialization }
SeasideGemServer >> initialize [
  | vmName |
  super initialize.
  vmName := self defaultMaintenanceVmName.
  self
    maintenanceVm:
      ((self class gemServerNamed: vmName)
        ifNil: [ MaintenanceVmGemServer register: vmName ])
]

{ #category : #accessing }
SeasideGemServer >> maintenanceVm [

   ^maintenanceVm
]

{ #category : #accessing }
SeasideGemServer >> maintenanceVm: anObject [

   maintenanceVm := anObject
]

{ #category : #'service instance-server' }
SeasideGemServer >> startBasicServerOn: port [
  "start instance of seaside adaptor. expected to return."

  | adaptor |
  GRPlatform current seasideLogServerStart: self class name port: port.
  adaptor := self serverClass port: port.
  self serverInstance: adaptor.
  adaptor gemServerStart
]

{ #category : #'service instance-control' }
SeasideGemServer >> startGems [
  super startGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer startGems ]
]

{ #category : #'service instance-control' }
SeasideGemServer >> statusGems [
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
SeasideGemServer >> stopGems [
  super stopGems.
  self maintenanceVm ifNotNil: [ :gemServer | gemServer stopGems ]
]
