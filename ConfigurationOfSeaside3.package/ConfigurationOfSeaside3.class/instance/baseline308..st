baselines-30
baseline308: spec
	<version: '3.0.8-baseline' imports: #('3.0.8-baseline-commonBaseline')>
	spec
		for: #squeakCommon
		do: [ 
			spec
				package: 'Javascript-Core' with: [ spec includes: #('Javascript-Pharo-Core') ];
				package: 'Seaside-Core' with: [ spec includes: #('Seaside-Pharo-Core') ];
				package: 'Seaside-Canvas' with: [ spec includes: #('Seaside-Pharo-Canvas') ];
				package: 'Seaside-Development' with: [ spec includes: #('Seaside-Pharo-Development') ];
				package: 'Seaside-Email' with: [ spec includes: #('Seaside-Pharo-Email') ];
				package: 'Seaside-Environment' with: [ spec includes: #('Seaside-Pharo-Environment') ];
				package: 'Seaside-Flow' with: [ spec includes: #('Seaside-Pharo-Flow') ];
				package: 'Seaside-Tools-Web' with: [ spec includes: #('Seaside-Pharo-Tools-Web') ];
				package: 'Seaside-Tools-OmniBrowser'
					with: [ 
							spec
								requires: #('OB');
								includes: #('Seaside-Pharo-Tools-OmniBrowser') ];
				package: 'Javascript-Tests-Core' with: [ spec includes: #('Javascript-Tests-Pharo-Core') ];
				package: 'Seaside-Tests-Core' with: [ spec includes: #('Seaside-Tests-Pharo-Core') ];
				package: 'Seaside-Tests-Development' with: [ spec includes: #('Seaside-Tests-Pharo-Development') ];
				package: 'Seaside-Tests-Email' with: [ spec includes: #('Seaside-Tests-Pharo-Email') ];
				package: 'Seaside-Tests-Flow' with: [ spec includes: #('Seaside-Tests-Pharo-Continuation') ];
				package: 'Seaside-Tests-Functional' with: [ spec includes: #('Seaside-Tests-Pharo-Functional') ];
				package: 'Seaside-Pharo-Canvas' with: [ spec requires: #('Seaside-Pharo-Core' 'Seaside-Canvas') ];
				package: 'Comet-Pharo-Core' with: [ spec requires: #('Comet-Core') ];
				package: 'Javascript-Pharo-Core' with: [ spec requires: #('Javascript-Core' 'Seaside-Pharo-Core') ];
				package: 'Seaside-Pharo-Core' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Pharo-Continuation';
				package: 'Seaside-Pharo-Development'
					with: [ spec requires: #('Seaside-Development' 'Seaside-Pharo-Tools-Web' 'Seaside-Pharo-Flow') ];
				package: 'Seaside-Pharo-Email' with: [ spec requires: #('Seaside-Email' 'Seaside-Pharo-Core') ];
				package: 'Seaside-Pharo-Environment'
					with: [ spec requires: #('Seaside-Environment' 'Seaside-Pharo-Core' 'Seaside-Pharo-Canvas') ];
				package: 'Seaside-Pharo-Flow' with: [ spec requires: #('Seaside-Flow' 'Seaside-Pharo-Continuation') ];
				package: 'Seaside-Pharo-Tools-OmniBrowser' with: [ spec requires: #('Seaside-Tools-OmniBrowser') ];
				package: 'Seaside-Pharo-Tools-Web'
					with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Pharo-Core' 'Seaside-Pharo-Canvas') ];
				package: 'Seaside-Adaptors-Comanche' with: [ spec requires: #('Seaside-Core' 'Kom') ];
				package: 'Seaside-Slime' with: [ spec requires: #('Grease Slime') ];
				package: 'Comet-Core'
					with: [ 
							spec
								requires: #('Seaside-Canvas' 'Javascript-Core');
								includes: #('Comet-Pharo-Core') ];
				package: 'Comet-Examples' with: [ spec requires: #('JQuery-UI' 'Comet-Core') ];
				package: 'Seaside-FileSystem' with: [ spec requires: #('SPort2') ];
				package: 'WebClient-Seaside'
					with: [ 
							spec repository: 'http://ss3.gemtalksystems.com/ss/WebClient'.
							spec requires: #('WebClient Project' 'Seaside-Core' 'OB') ];
				package: 'Comet-Tests-Core' with: [ spec requires: #('Javascript-Tests-Core' 'Comet-Core') ];
				package: 'Javascript-Tests-Pharo-Core' with: [ spec requires: #('Javascript-Pharo-Core' 'Javascript-Tests-Core') ];
				package: 'Seaside-Tests-Pharo-Continuation' with: [ spec requires: #('Seaside-Pharo-Continuation') ];
				package: 'Seaside-Tests-Pharo-Core' with: [ spec requires: #('Seaside-Pharo-Core' 'Seaside-Tests-Core') ];
				package: 'Seaside-Tests-Pharo-Development'
					with: [ spec requires: #('Seaside-Tests-Development' 'Seaside-Pharo-Development') ];
				package: 'Seaside-Tests-Pharo-Email'
					with: [ spec requires: #('Seaside-Email' 'Seaside-Pharo-Email' 'Grease Core Tests') ];
				package: 'Seaside-Tests-Pharo-Functional'
					with: [ 
							spec
								requires:
									#('Seaside-Tests-Functional' 'Seaside-Tests-Environment' 'Seaside-Pharo-Environment' 'Seaside-Tests-Pharo-Core') ];
				package: 'Seaside-Tests-Adaptors-Comanche'
					with: [ spec requires: #('Seaside-Adaptors-Comanche' 'Seaside-Tests-Pharo-Core') ];
				package: 'Seaside-Tests-Slime'
					with: [ spec requires: #('Seaside-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests') ].
			spec
				group: 'Core' with: #('Comet-Core' 'Comet-Examples');
				group: 'Development' with: #('Seaside-Slime');
				group: 'Development Tests' with: #('Seaside-Tests-Slime');
				group: 'Tests' with: #('Comet-Tests-Core');
				group: 'OneClick'
					with:
						#('Base' 'Development' 'RSS-Core' 'Javascript-Core' 'Prototype-Core' 'Scriptaculous-Core' 'JQuery-Core' 'JQuery-UI' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-InternetExplorer' 'Seaside-Examples' 'RSS-Examples' 'Seaside-Tools-Web' 'Scriptaculous-Components' 'Seaside-Welcome' 'Seaside-Tools-OmniBrowser' 'Comet-Core' 'Comet-Examples' 'Base Tests' 'Development Tests' 'RSS-Tests-Core' 'Javascript-Tests-Core' 'Seaside-Tests-Email' 'Seaside-Tests-Functional' 'Prototype-Tests-Core' 'Scriptaculous-Tests-Core' 'Scriptaculous-Tests-Components' 'JQuery-Tests-Core' 'JQuery-Tests-UI' 'Seaside-Tests-HTML5' 'Seaside-Tests-InternetExplorer' 'Seaside-Tests-Examples' 'Seaside-Tests-Tools-Web' 'Seaside-Tests-UTF8' 'Comet-Tests-Core') ].
	spec
		for: #squeak
		do: [ 
			spec
				package: 'Seaside-Welcome' with: [ spec includes: #('Seaside-Squeak-Welcome') ];
				package: 'Seaside-Squeak-Welcome' with: [ spec requires: #('Seaside-Welcome') ];
				package: 'Seaside-Tools-OmniBrowser' with: [ spec includes: #('Seaside-Squeak-Tools-OmniBrowser') ];
				package: 'Seaside-Squeak-Tools-OmniBrowser'
					with: [ 
							spec
								requires: #('Seaside-Tools-OmniBrowser');
								requires: #('Seaside-Pharo-Tools-OmniBrowser');
								yourself ];
				yourself.
			spec
				group: 'Core' with: #('Seaside-Adaptors-Comanche');
				group: 'OneClick' with: #('Seaside-Adaptors-Comanche' 'Seaside-Tools-OmniBrowser');
				yourself.
			spec
				removeGroup: 'Zinc';
				removePackage: 'Zinc-Seaside';
				removeProject: 'Zinc'	"Zinc is not (yet?) available for Squeak" ].
	spec
		for: #pharo
		do: [ 
			spec project: 'Zinc' with: [ spec loads: #('Zinc-HTTP') ].
			spec
				package: 'Seaside-Welcome' with: [ spec includes: #('Seaside-Pharo-Welcome') ];
				package: 'Seaside-Pharo-Welcome' with: [ spec requires: #('Seaside-Welcome') ].
			spec
				group: 'Core' with: #('Zinc-Seaside');
				group: 'OneClick' with: #('Zinc-Seaside') ].
	spec
		for: #('pharo1.x' 'squeak')
		do: [ 
			spec
				package: 'Seaside-Pharo-BlockContextCore';
				package: 'Seaside-Pharo-Core' with: [ spec requires: #('Seaside-Core' 'Seaside-Pharo-BlockContextCore') ].
			spec
				group: 'Tests' with: #('Comet-Tests-Core');
				group: 'OneClick' with: #('Seaside-Tools-OmniBrowser' 'Comet-Core' 'Comet-Examples') ].
	spec
		for: #'pharo2.x'
		do: [ 
			spec
				removeProject: 'OB';
				removeProject: 'Kom';
				removeProject: 'Swazoo2'.
			spec
				group: 'Core'
				overrides:
					#('Base' 'Development' 'RSS-Core' 'Javascript-Core' 'Prototype-Core' 'Scriptaculous-Core' 'JQuery-Core' 'JQuery-UI' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-InternetExplorer' 'Seaside-Examples' 'RSS-Examples' 'Seaside-Tools-Web' 'Scriptaculous-Components' 'Seaside-Welcome' 'Seaside-FileSystem' 'Zinc-Seaside') ].
	spec
		for: #'pharo3.x'
		do: [ 
			spec
				removeProject: 'OB';
				removeProject: 'Kom';
				removeProject: 'Swazoo2'.
			spec
				group: 'Core'
				overrides:
					#('Base' 'Development' 'RSS-Core' 'Javascript-Core' 'Prototype-Core' 'Scriptaculous-Core' 'JQuery-Core' 'JQuery-UI' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-InternetExplorer' 'Seaside-Examples' 'RSS-Examples' 'Seaside-Tools-Web' 'Scriptaculous-Components' 'Seaside-Welcome' 'Seaside-FileSystem' 'Zinc-Seaside') ].
	spec
		for: #gemstone
		do: [ 
			spec repository: 'http://seaside.gemstone.com/ss/Seaside30'.
			spec
				project: 'GsCore'
					with: [ 
							spec
								className: 'ConfigurationOfGsCore';
								versionString: #stable;
								repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
				project: 'FastCGI'
					with: [ 
							spec
								className: 'ConfigurationOfGsFastCGI';
								versionString: #stable;
								loads: #('FastCGI');
								repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
				project: 'OB'
					with: [ 
							spec
								className: 'ConfigurationOfGsOB';
								versionString: #stable;
								repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].
			spec
				package: 'Javascript-Core' with: [ spec includes: #('Javascript-GemStone-Core') ];
				package: 'Seaside-Core' with: [ spec includes: #('Seaside-GemStone-Core') ];
				package: 'Seaside-Development' with: [ spec includes: #('Seaside-GemStone-Development') ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec includes: #('Seaside-GemStone-Adaptors-Swazoo') ];
				package: 'Zinc-Seaside' with: [ spec includes: #('Seaside-GemStone-Adaptors-Zinc') ];
				package: 'Seaside-Email' with: [ spec includes: #('Seaside-GemStone-Email') ];
				package: 'Seaside-Flow' with: [ spec includes: #('Seaside-GemStone-Flow') ];
				package: 'Seaside-Environment'
					with: [ spec includes: #('Seaside-GemStone-Environment' 'Seaside-GemStone-Tools-Production') ];
				package: 'Seaside-Session'
					with: [ 
							spec
								includes: #('Seaside-GemStone-Session');
								file: 'Seaside-Session.gemstone' ];
				package: 'Seaside-Tools-OmniBrowser'
					with: [ 
							spec
								requires: #('OB');
								includes: #('Seaside-GemStone-Tools-OmniBrowser') ];
				package: 'Seaside-Tools-Web' with: [ spec includes: #('Seaside-GemStone-Tools-Web') ];
				package: 'Seaside-Welcome' with: [ spec includes: #('Seaside-GemStone-Welcome') ];
				package: 'Seaside-Tests-Core' with: [ spec includes: #('Seaside-Tests-GemStone-Core') ];
				package: 'Seaside-Tests-Development' with: [ spec includes: #('Seaside-Tests-GemStone-Development') ];
				package: 'Seaside-Tests-Flow'
					with: [ spec includes: #('Seaside-Tests-GemStone-Continuation' 'Seaside-Tests-GemStone-Flow') ];
				package: 'Seaside-Tests-Functional' with: [ spec includes: #('Seaside-Tests-GemStone-Functional') ];
				package: 'JQuery-UI' with: 'JQuery-UI.gemstone';
				package: 'Javascript-GemStone-Core' with: [ spec requires: #('Javascript-Core') ];
				package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone';
				package: 'Seaside-Core' with: 'Seaside-Core.gemstone';
				package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop.gemstone';
				package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop.gemstone';
				package: 'Seaside-GemStone-Basic-Development' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-GemStone-Continuation';
				package: 'Seaside-GemStone-Core' with: [ spec requires: #('Seaside-Core' 'GsCore') ];
				package: 'Seaside-GemStone-Development'
					with: [ spec requires: #('Seaside-Development' 'Seaside-GemStone-Basic-Development' 'Seaside-GemStone-Tools-Production') ];
				package: 'Seaside-GemStone-Email' with: [ spec requires: #('Seaside-Email') ];
				package: 'Seaside-GemStone-Environment' with: [ spec requires: #('Seaside-Environment') ];
				package: 'Seaside-GemStone-Flow' with: [ spec requires: #('Seaside-Flow' 'Seaside-GemStone-Continuation') ];
				package: 'Seaside-GemStone-ServiceTask' with: [ spec requires: #('Seaside-GemStone-Tools-Production') ];
				package: 'Seaside-GemStone-Session' with: [ spec requires: #('Seaside-Session') ];
				package: 'Seaside-GemStone-Tools-OmniBrowser' with: [ spec requires: #('Seaside-Tools-OmniBrowser') ];
				package: 'Seaside-GemStone-Tools-Production'
					with: [ spec requires: #('Seaside-Widgets' 'Seaside-GemStone-Basic-Development') ];
				package: 'Seaside-GemStone-Tools-Web' with: [ spec requires: #('Seaside-Tools-Web') ];
				package: 'Seaside-GemStone-Welcome' with: [ spec requires: #('Seaside-Welcome') ];
				package: 'Seaside-Adaptors-FastCGI' with: [ spec requires: #('Seaside-Core' 'FastCGI') ];
				package: 'Seaside-GemStone-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Adaptors-Swazoo') ];
				package: 'Seaside-GemStone-Adaptors-Zinc' with: [ spec requires: #('Zinc-Seaside') ];
				package: 'Seaside-FileSystem' with: [ spec requires: #('GsCore') ];
				package: 'Seaside-Tests-GemStone-Core' with: [ spec requires: #('Seaside-Tests-Core') ];
				package: 'Seaside-Tests-GemStone-Development' with: [ spec requires: #('Seaside-Tests-Development') ];
				package: 'Seaside-Tests-GemStone-Continuation' with: [ spec requires: #('Seaside-GemStone-Continuation') ];
				package: 'Seaside-Tests-GemStone-Flow' with: [ spec requires: #('Seaside-Tests-Flow') ];
				package: 'Seaside-Tests-GemStone-Functional' with: [ spec requires: #('Seaside-Tests-Functional') ].
			spec
				group: 'Base' with: #('Seaside-GemStone-Basic-Development');
				group: 'Core' with: #('Seaside-Adaptors-FastCGI' 'Seaside-Adaptors-Swazoo') ].
	spec
		for: #'gs2.4.x'
		do: [ 
			spec
				package: 'Seaside-Core' with: [ spec includes: #('Seaside-GemStone240-Core') ];
				package: 'Seaside-GemStone240-Core'
					with: [ 
							spec
								requires: #('Seaside-Core');
								includes: #('Seaside-GemStone-Core') ];
				package: 'Seaside-GemStone-Core' with: [ spec requires: #('Seaside-GemStone240-Core') ] ].
	spec
		for: #'gs3.x'
		do: [ 
			spec
				package: 'Seaside-Core' with: [ spec includes: #('Seaside-GemStone300-Core') ];
				package: 'Seaside-GemStone300-Core'
					with: [ 
							spec
								requires: #('Seaside-Core');
								includes: #('Seaside-GemStone-Core') ];
				package: 'Seaside-GemStone-Core' with: [ spec requires: #('Seaside-GemStone300-Core') ] ].
	spec for: #'gs3.1.x' do: [ spec package: 'Seaside-GemStone-Flow' with: [ spec file: #('Seaside-GemStone-Flow.310') ] ]