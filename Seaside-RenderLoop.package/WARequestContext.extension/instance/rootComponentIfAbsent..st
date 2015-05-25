*seaside-renderloop
rootComponentIfAbsent: aNiladicBlock
	"Answer the root component if set, the value of aNiladicBlock if not set."
	^ self properties at: #rootComponent ifAbsent: aNiladicBlock