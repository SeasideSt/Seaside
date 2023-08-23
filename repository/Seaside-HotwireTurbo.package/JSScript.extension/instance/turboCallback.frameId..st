*Seaside-HotwireTurbo
turboCallback: aNiladicValuable frameId: frameId

	self add: 
		(self turbo call: 'visit' withArguments: { 
				 (self renderContext actionUrl withField:
					  (self renderContext callbacks store: (WATurboFrameActionCallback on: aNiladicValuable))).
				 (Dictionary new
					  add: 'action' -> 'replace';
					  add: 'frame' -> frameId;
					  yourself) })