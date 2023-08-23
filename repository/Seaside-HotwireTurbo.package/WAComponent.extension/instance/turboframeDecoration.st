*Seaside-HotwireTurbo
turboframeDecoration

	^ self decorations detect:[ :dec | dec isTurboFrame ] ifNone: [ nil ]