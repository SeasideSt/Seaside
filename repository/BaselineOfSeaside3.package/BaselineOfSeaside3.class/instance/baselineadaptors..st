baselines
baselineadaptors: spec

	spec
		for: #( #squeakCommon #'gs3.0.x' #'gs3.1.x' #'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' )
		do: [ spec
				project: 'Swazoo2'
				with: [ spec
						versionString: #stable;
						className: 'ConfigurationOfSwazoo2';
						loads: #('Swazoo');
						repository: 'http://smalltalkhub.com/mc/Swazoo/Swazoo/main' ].
			spec
				package: 'Seaside-Swazoo'
					with: [ spec
						requires: #('Grease' 'Swazoo2');
						repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo') ].
			spec group: 'Swazoo' with: #('Seaside-Adaptors-Swazoo') ].

	spec
		for: #squeakCommon
		do: [ spec
				project: 'WebClient Project'
				with: [ spec
						versionString: '1.5';
						className: 'ConfigurationOfWebClient';
						loads: #('Core');
						repository: 'http://ss3.gemtalksystems.com/ss/WebClient' ].
			spec
				package: 'WebClient-Seaside-Adaptor'
				with: [
					spec
						repository: 'http://ss3.gemtalksystems.com/ss/WebClient';
					 	requires: #('WebClient Project' 'Seaside-Core') ].
			spec group: 'WebClient' with: #('WebClient-Seaside-Adaptor') ].

	spec for: #squeak do: [ spec package: 'WebClient-Seaside-OB' with: [ spec requires: #('OB' 'Seaside-Tools-OmniBrowser') ] ].

	spec
		for: #pharo
		do: [
			spec
				package: 'Seaside-Adaptors-Comanche' with: [ spec requires: #('KomHttpServerLight' 'Seaside-Core') ];
				package: 'KomHttpServerLight' with: [ spec repository: 'http://www.smalltalkhub.com/mc/Seaside/KomHttpServer/main' ];
				package: 'Seaside-Tests-Adaptors-Comanche' with: [ spec requires: #('Seaside-Adaptors-Comanche') ];
				package: 'Seaside-Zinc-Core' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Zinc-Pharo' with: [ spec requires: #('Seaside-Zinc-Core') ];
				package: 'Seaside-Zinc-Tests' with: [ spec requires: #('Seaside-Zinc-Pharo') ].
			spec
				group: 'Kom' with: #('Seaside-Adaptors-Comanche');
				group: 'Zinc' with: #('Seaside-Zinc-Pharo');
				group: 'Tests' with: #('Seaside-Zinc-Tests');
				group: 'default' with: #('Zinc');
				group: 'CI' with: #('Zinc') ].

	spec
		for: #gemstone
		do: [ spec
				project: 'FastCGI Project'
					with: [ spec
						className: 'ConfigurationOfGsFastCGI';
						versionString: #stable;
						loads: #('FastCGI');
						repository: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
				baseline: 'GsApplicationTools'
					with: [ spec
						loads: 'Core';
						repository: 'github://GsDevKit/gsApplicationTools:master/repository' ];
				baseline: 'Zinc Project'
					with: [ spec
						className: 'BaselineOfZincHTTPComponents';
						loads: #('Core');
						repository: 'github://GsDevKit/zinc:gs_master/repository' ].
			spec
				package: 'Seaside-GemStone-GemServer-Core' with: [ spec requires: #('GsApplicationTools' 'Seaside-Core') ];
				package: 'Seaside-GemStone-GemServer-Tests' with: [ spec requires: #('Seaside-GemStone-GemServer-Core' 'Seaside-GemStone-Development' 'Seaside-GemStone-Adaptors-Zinc' 'Seaside-Adaptors-FastCGI') ];
				package: 'Seaside-Zinc-Core'
					with: [ spec
						requires: #('Zinc Project' 'Seaside-Core');
						includes: #('Seaside-GemStone-Adaptors-Zinc') ];
				package: 'Seaside-Adaptors-FastCGI' with: [ spec requires: #('Seaside-Core' 'FastCGI Project' 'Seaside-GemStone-GemServer-Core') ];
				package: 'Seaside-GemStone-Adaptors-Zinc' with: [ spec requires: #('Seaside-Zinc-Core' 'Seaside-GemStone-GemServer-Core') ];
				package: 'Seaside-Zinc-Tests' with: [ spec requires: #('Seaside-Zinc-Core') ].
			spec
				group: 'FastCGI' with: #('Seaside-Adaptors-FastCGI');
				group: 'Tests' with: #('Seaside-GemStone-GemServer-Tests' 'Seaside-Zinc-Tests');
				group: 'Zinc' with: #('Seaside-Zinc-Core') ].

	spec
		for:  #(#'gs3.0.x' #'gs3.1.x' #'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' )
		do: [
			spec
				package: 'Seaside-GemStone-GemServer-Tests' with: [ spec includes: #( 'Seaside-GemStone-GemServer-Swazoo-Tests') ];
				package: 'Seaside-GemStone-GemServer-Swazoo-Tests' with: [ spec requires: #('Seaside-GemStone-Adaptors-Swazoo') ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec includes: #('Seaside-GemStone-Adaptors-Swazoo') ];
				package: 'Seaside-GemStone-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Adaptors-Swazoo' 'Seaside-GemStone-GemServer-Core') ] ]