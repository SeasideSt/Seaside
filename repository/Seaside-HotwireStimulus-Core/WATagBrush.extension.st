Extension { #name : 'WATagBrush' }

{ #category : '*Seaside-HotwireStimulus-Core' }
WATagBrush >> stimulusAction: aString [

	self dataAttributeAt: 'action' put: aString
]

{ #category : '*Seaside-HotwireStimulus-Core' }
WATagBrush >> stimulusController: aString [

	self dataAttributeAt: 'controller' put: aString
]

{ #category : '*Seaside-HotwireStimulus-Core' }
WATagBrush >> stimulusTarget: targetName inController: controllerName [

	self dataAttributeAt: controllerName,'-target' put: targetName
]
