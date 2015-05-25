baselines-310
baseline310rest: spec

	spec for: #'common' do: [	
		spec blessing: #baseline.
		spec 
			package: 'Seaside-REST-Core' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Tests-REST-Core' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Tests-Core') ].
		spec 
			group: 'REST' with: #('Seaside-REST-Core');
			group: 'REST Tests' with: #('Seaside-Tests-REST-Core')
	].

	spec for: #(squeak 'pharo1.x') do:[
		spec
			package: 'Seaside-Pharo-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo-REST-Core')]
	].

	spec for: #('pharo2.x' 'pharo3.x') do:[
		spec
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo20-REST-Core')]
	].
