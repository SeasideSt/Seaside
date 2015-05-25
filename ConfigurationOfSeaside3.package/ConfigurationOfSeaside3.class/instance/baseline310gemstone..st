baselines-310
baseline310gemstone: spec

	spec for: #'gs3.x' do: [
		spec
			baseline:'Seaside3' with: [ spec  repository: 'github://glassdb/Seaside31:gemstone3.1/repository' ];
			import: 'Seaside3']