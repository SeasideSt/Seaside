baselines
baselinejquery: spec

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'JQuery-Core' with: [
				spec requires: #('Javascript-Core' ) ];
			package: 'JQuery-Tests-Core' with: [
				spec requires: #('JQuery-Core' 'Javascript-Tests-Core' 'Seaside-Development' 'Seaside-Tests-Functional' 'Seaside-Ajaxifier-Core') ];
			package: 'JQuery-Examples' with: [ 
				spec requires: #('JQuery-Core' 'Seaside-Component' 'Seaside-Examples') ];
			package: 'JQuery-JSON' with: [
				spec requires: #('JQuery-Core' 'Seaside-JSON-Core') ];
			package: 'JQuery-Tests-JSON' with: [
				spec requires: #('JQuery-JSON' 'JQuery-Tests-Core') ].
		
		spec 
			group: 'JQuery' with: #('JQuery-Core' 'JQuery-JSON');
			group: 'JQuery Tests' with: #('JQuery-Tests-Core' 'JQuery-Tests-JSON');
			group: 'Examples' with: #('JQuery-Examples');
			group: 'Tests' with: #( 'JQuery Tests' ) ]
