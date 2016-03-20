baselines-320
baseline320adaptors: spec
	spec
		for: #squeakCommon
		do: [ 
			spec blessing: #baseline.

			spec
				project: 'WebClient Project'
				with: [ 
					spec
						versionString:  #stable;
						className: 'ConfigurationOfWebClient';
						loads: #('Core');
						repository: 'http://ss3.gemtalksystems.com/ss/WebClient' ].		
			spec
				project: 'Swazoo2'
				with: [ 
					spec
						versionString: #stable;
						className: 'ConfigurationOfSwazoo2';
						loads: #('Swazoo');
						repository: 'http://smalltalkhub.com/mc/Swazoo/Swazoo/main' ].
					
			spec 
				package: 'WebClient-Seaside-Adaptor' 
				with: [ spec repository: 'http://ss3.gemtalksystems.com/ss/WebClient'  .
					    spec requires: #('WebClient Project' 'Seaside-Core') ].
			spec
				package: 'Seaside-Swazoo'
					with: [ 
							spec
								requires: #('Grease' 'Swazoo2');
								repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo') ].
			spec
				group: 'Swazoo' with: #('Seaside-Adaptors-Swazoo');
				group: 'WebClient' with: #('WebClient-Seaside-Adaptor') ].
	spec
		for: #(#'squeak4.6.x' #'squeak5.x')
		do: [
			spec
				package: 'Seaside-Squeak-Tools-Development'
				with: [
					spec
						includes: #('WebClient-Seaside-Tools-Development') ];
				package: 'WebClient-Seaside-Tools-Development' 
				with: [
					spec
						repository: 'http://ss3.gemtalksystems.com/ss/WebClient';
						requires: #('Seaside-Squeak-Tools-Development') ] ].
	spec
		for: #pharo
		do: [
			spec
				package: 'Zinc-Seaside'
				with: [ 
					spec
						repository: 'http://mc.stfx.eu/ZincHTTPComponents';
						requires: #('Zinc Project' 'Seaside-Core') ].
			spec
				project: 'Zinc Project'
				with: [ 
					spec
						versionString: #stable;
						className: 'ConfigurationOfZincHTTPComponents';
						repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
			spec project: 'Zinc Project' with: [ spec loads: #('Zinc-HTTP') ].
			spec
				package: 'Seaside-Adaptors-Comanche' with: [ spec requires: #('KomHttpServerLight' 'Seaside-Core') ];
				package: 'KomHttpServerLight'
					with: [ spec repository: 'http://www.smalltalkhub.com/mc/Seaside/KomHttpServer/main' ];
				package: 'Seaside-Tests-Adaptors-Comanche' with: [ spec requires: #('Seaside-Adaptors-Comanche') ].
			spec
				group: 'Kom' with: #('Seaside-Adaptors-Comanche');
				group: 'Comanche' with: #('Seaside-Adaptors-Comanche');
				group: 'Zinc' with: #('Zinc-Seaside') ].
	spec
		for: #'pharo1.x'
		do: [ spec package: 'Seaside-Tests-Adaptors-Comanche' with: [ spec requires: #('Seaside-Tests-Pharo-Core') ] ].