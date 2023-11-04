*Seaside-HotwireTurbo-Core
turboframeDecoration

	^ self decorations detect:[ :dec | dec isTurboFrame ] ifNone: [ nil ]
