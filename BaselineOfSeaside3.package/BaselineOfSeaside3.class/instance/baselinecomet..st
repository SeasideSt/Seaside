baselines
baselinecomet: spec

	spec for: #'squeakCommon' do: [
		spec blessing: #baseline.
		spec 
			package: 'Comet-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Canvas' ) ];
			package: 'Comet-Tests-Core' with: [
				spec requires: #('Javascript-Tests-Core' 'Comet-Core' ) ];
			package: 'Comet-Examples' with: [
				spec requires: #('JQuery-Core' 'Comet-Core') ].
		
		spec 
			package: 'Comet-Core' with: [
				spec includes: #('Comet-Pharo-Core' ) ];
			package: 'Comet-Pharo-Core' with: [
				spec requires: #('Comet-Core' ) ].
			
		spec 
			group: 'Comet' with: #('Comet-Core');
			group: 'Comet Tests' with: #('Comet-Tests-Core' );
			group: 'Comet Examples' with: #('Comet-Examples' );
			group: 'Tests' with: #('Comet Tests') ]