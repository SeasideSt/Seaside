Class {
	#name : #MaintenanceVmGemServer,
	#superclass : #WAGemStoneAbstractTaskGemServer,
	#category : 'Seaside-GemStone-GemServer-Core'
}

{ #category : #accessing }
MaintenanceVmGemServer class >> taskClass [
  ^ WAGemStoneMaintenanceTask
]
