baselines-310
baseline310scriptaculous: spec

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'Prototype-Core' with: [
				spec requires: #('Javascript-Core' ) ];
			package: 'Prototype-Tests-Core' with: [
				spec requires: #('Prototype-Core' 'Javascript-Tests-Core' 'Seaside-Tests-Functional') ];
			package: 'Scriptaculous-Core' with: [
				spec requires: #('Prototype-Core') ];
			package: 'Scriptaculous-Tests-Core' with: [
				spec requires: #('Scriptaculous-Core' 'Prototype-Tests-Core') ];
			package: 'Scriptaculous-Components' with: [
				spec requires: #('Scriptaculous-Core' 'Seaside-Flow' 'Seaside-Widgets' 'Seaside-Component') ];
			package: 'Scriptaculous-Tests-Components' with: [
				spec requires: #('Scriptaculous-Components' 'Scriptaculous-Tests-Core') ].
		spec 
			group: 'Scriptaculous' with: #('Scriptaculous-Core' 'Scriptaculous-Components');
			group: 'Scriptaculous Tests' with: #('Prototype-Tests-Core' 'Scriptaculous-Tests-Core' 'Scriptaculous-Tests-Components');
			group: 'Tests' with: #( 'Scriptaculous Tests' ) ]