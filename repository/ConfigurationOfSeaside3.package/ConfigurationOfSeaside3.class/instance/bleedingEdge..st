symbolic versions
bleedingEdge: spec
	<symbolicVersion: #'bleedingEdge'>
	
	spec for: #'common' version: '3.2.0-baseline'.
	"no bleedingEdge for older pharo"
	spec for: #('pharo1.x' 'pharo2.x') version: #'release3.1'.
