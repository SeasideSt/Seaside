symbolic versions
development: spec
	<symbolicVersion: #'development'>

	spec for: #'common' version: '3.2.0'.
	"no development for older pharo"
	spec for: #('pharo1.x' 'pharo2.x') version: #'release3.1'.
