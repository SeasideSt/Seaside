Extension { #name : 'JSScript' }

{ #category : '*Seaside-HotwireTurbo-Core' }
JSScript >> turbo [

	^ (JSStream on: 'Turbo')

]

{ #category : '*Seaside-HotwireTurbo-Core' }
JSScript >> turboCallback: aNiladicValuable [

	self turboCallback: aNiladicValuable target: (JSStream on: 'this.closest(''turbo-frame'').id')

]

{ #category : '*Seaside-HotwireTurbo-Core' }
JSScript >> turboCallback: aNiladicValuable target: frameId [

	self add: 
		(self turbo call: 'visit' withArguments: { 
				 (self renderContext actionUrl withField:
					  (self renderContext callbacks store: (WAActionCallback on: aNiladicValuable))).
				 (Dictionary new
					  add: 'action' -> 'replace';
					  add: 'frame' -> frameId;
					  yourself) })

]
