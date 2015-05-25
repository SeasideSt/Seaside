baselines-313
baseline313security: spec

	spec for: #'squeakCommon' do: [
		spec blessing: #baseline.
		spec 
			package: 'Seaside-Security' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Tests-Security' with: [
				spec requires: #('Seaside-Security' ) ].
		spec 
			group: 'JSON' with: #('Seaside-JSON-Core');
			group: 'JSON Tests' with: #('Seaside-Tests-JSON' );
			group: 'Tests' with: 'JSON Tests' ].
		
	spec for: #'squeakCommon' do: [
		spec 
			package: 'Seaside-Security' with: [
				spec includes: #('Seaside-Pharo-Security') ].
		spec 
			package: 'Seaside-Tests-Security' with: [
				spec requires: #('Seaside-Tests-Pharo-Security') ] ].