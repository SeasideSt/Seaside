instance creation
to: aCompiledMethod offset: offset markerBlock: aBlock

	| partial frameIndex |
	frameIndex := self findFrameIndexFor: aCompiledMethod.
	partial := GsProcess 
		partialContinuationFromLevel: 3 + offset
		to: frameIndex.
	^(self basicNew) 
		with: partial;
		markerBlock: aBlock;
		yourself