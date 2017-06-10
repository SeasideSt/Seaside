baselines-320
baseline320rest: spec

	spec for: #'squeakCommon' do: [	
		spec blessing: #baseline.
		spec 
			package: 'Seaside-REST-Core' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Tests-REST-Core' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Tests-Core') ];
			package: 'Seaside-Swagger-Core' with: [ 
				spec requires: #('Seaside-REST-Core' 'Seaside-JSON-Core') ];
			package: 'Seaside-Tests-Swagger-Core' with: [ 
				spec requires: #('Seaside-Swagger-Core' 'Seaside-Tests-REST-Core') ].
		spec 
			group: 'REST' with: #('Core' 'Seaside-REST-Core');
			group: 'Swagger' with: #('REST' 'Seaside-Swagger-Core');
			group: 'REST Tests' with: #('REST' 'Seaside-Tests-REST-Core');
			group: 'Swagger Tests' with: #('Swagger' 'Seaside-Tests-Swagger-Core')
	 ].

	spec for: #(#'squeak' #'pharo1.x') do:[
		spec
			package: 'Seaside-Pharo-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo-REST-Core')];
			package: 'Seaside-Squeak-Swagger-Core';
			package: 'Seaside-Pharo-Swagger-Core';
			package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-Pharo-Swagger-Core' 'Seaside-Squeak-Swagger-Core') ]
	].

	spec for: #(#'pharo2.x' #'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x') do:[
		spec
			package: 'Seaside-Pharo20-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo20-REST-Core') ];
			package: 'Seaside-Pharo-Swagger-Core';
			package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-Pharo-Swagger-Core') ].
	].
