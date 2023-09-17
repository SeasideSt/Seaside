*Seaside-HotwireTurbo
turboCallback: aNiladicValuable target: frameId

	self add: 
		(self turbo call: 'visit' withArguments: { 
				 (self renderContext actionUrl withField:
					  (self renderContext callbacks store: (WAActionCallback on: aNiladicValuable))).
				 (Dictionary new
					  add: 'action' -> 'replace';
					  add: 'frame' -> frameId;
					  yourself) })