baselines-320
baseline320filesystem: spec

	spec for: #'squeakCommon' do: [
		
		spec 
			package: 'Seaside-FileSystem' with: [ spec requires: #('Seaside-Core') ];
			package: 'Seaside-Tests-FileSystem' with: [ spec requires: #('Seaside-FileSystem') ].
				
		spec
			group: 'Filesystem' with: #('Seaside-FileSystem' );
			group: 'Filesystem Tests' with: #( 'Filesystem' 'Seaside-Tests-FileSystem');
			group: 'Tests' with: #('Filesystem Tests') 
	].

	spec for: #pharo do: [ 
		
		spec
			package: 'Seaside-Pharo-FileSystem';
			package: 'Seaside-FileSystem' with: [ spec includes: 'Seaside-Pharo-FileSystem' ].
			
	]