baselines
baseline30: spec
	<version: '3.3-baseline'>
	spec for: #pharo do: [ 
		spec 
			baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ];
			import: 'Seaside3'
	]