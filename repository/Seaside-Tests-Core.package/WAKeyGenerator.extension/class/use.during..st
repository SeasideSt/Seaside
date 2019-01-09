*Seaside-Tests-Core
use: aKeyGenerator during: aNiladicBlock
	| old |
	old := current.
	current := aKeyGenerator.
	^ aNiladicBlock ensure: [
		current := old ]