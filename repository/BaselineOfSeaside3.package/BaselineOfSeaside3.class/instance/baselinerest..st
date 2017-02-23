baselines
"protocol: baselines"
baselinerest: spec

	spec for: #'common' do: [	
		spec 
			package: 'Seaside-REST-Core' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Tests-REST-Core' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Tests-Core') ];
			package: 'Seaside-Swagger-Core' with: [ 
				spec requires: #('Seaside-REST-Core' 'Seaside-JSON-Core' 'Seaside-Component') ];
			package: 'Seaside-Tests-Swagger-Core' with: [ 
				spec requires: #('Seaside-Tests-REST-Core' 'Seaside-Swagger-Core') ].
		spec 
			group: 'REST' with: #('Core' 'Seaside-REST-Core');
			group: 'Swagger' with: #('REST' 'Seaside-Swagger-Core');
			group: 'REST Tests' with: #('REST' 'Seaside-Tests-REST-Core');
			group: 'Swagger Tests' with: #('Swagger' 'Seaside-Tests-Swagger-Core')
	].

	spec for: #(squeak 'pharo1.x') do:[
		spec
			package: 'Seaside-Pharo-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo-REST-Core')];
			package: 'Seaside-Squeak-Swagger-Core';
			package: 'Seaside-Pharo-Swagger-Core';
			package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-Pharo-Swagger-Core' 'Seaside-Squeak-Swagger-Core') ]
	].

	spec for: #('pharo2.x' 'pharo3.x' 'pharo4.x' 'pharo5.x' #'pharo6.x') do:[
		spec
			package: 'Seaside-Pharo20-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo20-REST-Core')];
			package: 'Seaside-Pharo-Swagger-Core';
			package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-Pharo-Swagger-Core') ]
	].

	spec for: #gemstone do:[
		spec
        	package: 'Seaside-GemStone-REST-Core' with: [ 
			spec requires: #('Seaside-Core') ];
		package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-GemStone-REST-Core')];
		package: 'Seaside-GemStone-Swagger-Core';
		package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-GemStone-Swagger-Core') ]
	].