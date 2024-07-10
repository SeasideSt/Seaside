baselines
baselinerest: spec 

	spec for: #'common' do: [	
		spec 
			package: 'Seaside-REST-Core' with: [
				spec requires: #('Seaside-Core') ]; 
			package: 'Seaside-REST-Examples' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Canvas' 'Seaside-RenderLoop' 'Seaside-Examples') ];
			package: 'Seaside-Tests-REST-Core' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Tests-Core') ].
		spec 
			group: 'REST' with: #('Seaside-REST-Core');
			group: 'REST Tests' with: #('REST' 'Seaside-Tests-REST-Core')
	].


	spec for: #'squeakCommon' do: [
		spec
			package: 'Seaside-Swagger-Core' with: [ 
				spec requires: #('Seaside-REST-Core' 'Seaside-JSON-Core' 'Seaside-Component') ];
			package: 'Seaside-Tests-Swagger-Core' with: [ 
				spec requires: #('Seaside-Tests-REST-Core' 'Seaside-Swagger-Core') ].
		spec 
			group: 'REST' with: #('Seaside-REST-Core');
			group: 'Swagger' with: #('REST' 'Seaside-Swagger-Core');
			group: 'Swagger Tests' with: #('Swagger' 'Seaside-Tests-Swagger-Core')
	].

	spec for: #(squeak) do:[
		spec
			package: 'Seaside-Squeak-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Squeak-REST-Core') ];
			package: 'Seaside-Squeak-Swagger-Core';
			package: 'Seaside-Pharo-Swagger-Core';
			package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-Pharo-Swagger-Core' 'Seaside-Squeak-Swagger-Core') ]
	].

	spec 
		for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x' #'pharo8.x') 
		do:[
			spec
				package: 'Seaside-Pharo20-REST-Core';
				package: 'Seaside-REST-Core' with:[
					spec includes: #('Seaside-Pharo20-REST-Core') ];
				package: 'Seaside-Pharo-Swagger-Core';
				package: 'Seaside-Swagger-Core' with: [ 
					spec includes: #('Seaside-Pharo-Swagger-Core') ]
	].

	spec 
		for: #('pharo9.x' 'pharo10.x' 'pharo11.x' 'pharo12.x' 'pharo13.x') 
		do:[
			spec
				package: 'Seaside-Pharo90-REST-Core';
				package: 'Seaside-REST-Core' with:[
					spec includes: #('Seaside-Pharo90-REST-Core') ];
				package: 'Seaside-Pharo-Swagger-Core';
				package: 'Seaside-Swagger-Core' with: [ 
					spec includes: #('Seaside-Pharo-Swagger-Core') ]
	].

	spec for: #gemstone do:[
		spec
        	package: 'Seaside-GemStone-REST-Core' with: [ 
			spec requires: #('Seaside-Core') ];
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-GemStone-REST-Core') ]
	].

	spec for: #'gs3.x' do:[
		spec
			package: 'Seaside-GemStone-Swagger-Core';
			package: 'Seaside-Swagger-Core'
          with: [ spec includes: #('Seaside-GemStone-Swagger-Core') ];
        package: 'Seaside-Tests-Swagger-Core'
          with: [ spec requires: #('Seaside-Tests-REST-Core' 'Seaside-Swagger-Core') ].
		spec
			group: 'Swagger' with: #('REST' 'Seaside-Swagger-Core');
			group: 'Swagger Tests' with: #('Swagger' 'Seaside-Tests-Swagger-Core')
	].