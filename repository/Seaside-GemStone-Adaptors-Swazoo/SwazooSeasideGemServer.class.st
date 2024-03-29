Class {
	#name : 'SwazooSeasideGemServer',
	#superclass : 'SeasideGemServer',
	#category : 'Seaside-GemStone-Adaptors-Swazoo',
	#package : 'Seaside-GemStone-Adaptors-Swazoo'
}

{ #category : 'accessing' }
SwazooSeasideGemServer class >> serverClass [
  ^ WAGsSwazooAdaptor
]
