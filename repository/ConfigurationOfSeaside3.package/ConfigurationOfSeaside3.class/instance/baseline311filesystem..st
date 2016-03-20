baselines-311-312
baseline311filesystem: spec

	spec for: #'squeakCommon' do: [
		
		spec project: 'SPort2' with: [
			spec
				versionString: '2.34';
				className: 'ConfigurationOfSPort2';
				loads: #('Sport');
				repository: 'http://smalltalkhub.com/mc/Sport/Sport/main' ].
		
		spec 
			package: 'Seaside-FileSystem' with: [
				spec 
					requires: #('Seaside-Core' 'SPort2');
					repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
			package: 'Seaside-Tests-FileSystem' with: [
				spec 
					requires: #('Seaside-FileSystem');
					repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ].
				
		spec
			group: 'Filesystem' with: #('Seaside-FileSystem' );
			group: 'Filesystem Tests' with: #( 'Filesystem' 'Seaside-Tests-FileSystem');
			group: 'Tests' with: #('Filesystem Tests') 
	].