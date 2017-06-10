versions-30
version30016: spec
	<version: '3.0.16' imports: #('3.0.16-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #released.
			spec description: 'Legacy release for Pharo40' ].	" split method into two for too many literals "
	self version30011common: spec.
	spec
		for: #squeakCommon
		do: [ 
			spec
				project: 'Grease Core' with: #'release1.0';
				project: 'Grease Core Tests' with: #'release1.0';
				project: 'Grease Slime' with: #'release1.0';
				project: 'Grease Slime Tests' with: #'release1.0';
				project: 'Kom' with: '1.0.9';
				project: 'OB' with: #stable;
				project: 'SPort2' with: '2.34';
				project: 'WebClient Project' with: '1.5'.
			spec
				package: 'Comet-Core' with: 'Comet-Core-lr.51';
				package: 'Comet-Examples' with: 'Comet-Examples-lr.23';
				package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-lr.6';
				package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-DaleHenrichs.9';
				package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-lr.70';
				package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-lr.3';
				package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-JohanBrichau.17';
				package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-JohanBrichau.58';
				package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-lr.13';
				package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
				package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
				package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser.pharoOB-NickAger.7';
				package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-JohanBrichau.40';
				package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.11';
				package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
				package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.14';
				package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.8';
				package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-JohanBrichau.25';
				package: 'Seaside-Tests-Pharo-Email' with: 'Seaside-Tests-Pharo-Email-pmm.1';
				package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-lr.13';
				package: 'WebClient-Seaside' with: 'WebClient-Seaside-ar.10' ].
	spec
		for: #squeak
		do: [ 
			spec
				package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
				package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-lr.25';
				package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-pmm.9';
				package: 'Seaside-Squeak-Tools-OmniBrowser' with: 'Seaside-Squeak-Tools-OmniBrowser-topa.1';
				package: 'Seaside-Squeak-Welcome' with: 'Seaside-Squeak-Welcome-NickAger.1';
				package: 'Seaside-Slime' with: 'Seaside-Slime-JohanBrichau.83';
				package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-JohanBrichau.26';
				package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-pmm.44'.
		].
			
	spec
		for: #(#'pharo1.x' #'pharo2.x' #'pharo3.x')
		do: [ 
			spec project: 'Zinc' with: #stable.
			spec
				package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
				package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2';
				package: 'Seaside-Slime' with: 'Seaside-Slime-JohanBrichau.83';
				package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-JohanBrichau.26';
				package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-pmm.44'.
			].
		
	spec for: #'pharo1.4.x' do: [ spec project: 'Kom' with: '1.1.1' ].
	
	spec
		for: #('pharo1.x' 'squeak')
		do: [ spec package: 'Seaside-Pharo-BlockContextCore' with: 'Seaside-Pharo-BlockContextCore-JohanBrichau.1' ].
		
	spec
		for: #(#'pharo4.x' #'pharo5.x')
		do: [ 
			spec 
				project: 'Zinc' with: #stable;
				project: 'Grease Core' with: #'release1.1';
				project: 'Grease Core Tests' with: #'release1.1';
				project: 'Grease Slime' with: #'release1.1';
				project: 'Grease Slime Tests' with: #'release1.1'.
			spec
				package: 'Seaside-Pharo40-Continuation' with: 'Seaside-Pharo40-Continuation-JohanBrichau.2';
				package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2';
				package: 'Seaside-Pharo40-Slime' with: 'Seaside-Pharo40-Slime-JohanBrichau.3';
				package: 'Seaside-Pharo40-Legacy' with: 'Seaside-Pharo40-Legacy-JohanBrichau.1';
				package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core.pharo40-JohanBrichau.1';
				package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-pmm.44'.
			].
		
  spec
    for: #'gemstone'
    do: [ 
      spec
        project: 'Grease Core' with: '1.0.9';
        project: 'Grease Core Tests' with: '1.0.9';
        project: 'GsCore' with: '0.246';
        project: 'FastCGI' with: '0.235';
        project: 'OB' with: #'stable';
        project: 'Swazoo2' with: '2.2.0.4';
        project: 'Zinc' with: '2.4.3'.
      spec
        package: 'Javascript-GemStone-Core'
          with: 'Javascript-GemStone-Core-DaleHenrichs.4';
        package: 'JQuery-UI' with: 'JQuery-UI.gemstone-dkh.81';
        package: 'Seaside-Adaptors-FastCGI'
          with: 'Seaside-Adaptors-FastCGI-dkh.26';
        package: 'Seaside-Core' with: 'Seaside-Core.gemstone-dkh.774';
        package: 'Seaside-GemStone-Adaptors-Swazoo'
          with: 'Seaside-GemStone-Adaptors-Swazoo-dkh.5';
        package: 'Seaside-GemStone-Adaptors-Zinc'
          with: 'Seaside-GemStone-Adaptors-Zinc-JohanBrichau.7';
        package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone-dkh.119';
        package: 'Seaside-GemStone-Basic-Development'
          with: 'Seaside-GemStone-Basic-Development-NickAger.25';
        package: 'Seaside-GemStone-Continuation'
          with: 'Seaside-GemStone-Continuation-DaleHenrichs.20';
        package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-dkh.63';
        package: 'Seaside-GemStone-Development'
          with: 'Seaside-GemStone-Development-dkh.27';
        package: 'Seaside-GemStone-Environment'
          with: 'Seaside-GemStone-Environment-dkh.12';
        package: 'Seaside-GemStone-Email'
          with: 'Seaside-GemStone-Email-topa.13';
        package: 'Seaside-GemStone-Flow'
          with: 'Seaside-GemStone-Flow-DaleHenrichs.11';
        package: 'Seaside-GemStone-Session'
          with: 'Seaside-GemStone-Session-DaleHenrichs.3';
        package: 'Seaside-GemStone-ServiceTask'
          with: 'Seaside-GemStone-ServiceTask-NickAger.20';
        package: 'Seaside-GemStone-Tools-Production'
          with: 'Seaside-GemStone-Tools-Production-dkh.13';
        package: 'Seaside-GemStone-Tools-Web'
          with: 'Seaside-GemStone-Tools-Web-DaleHenrichs.4';
        package: 'Seaside-GemStone-Tools-OmniBrowser'
          with: 'Seaside-GemStone-Tools-OmniBrowser-DaleHenrichs.4';
        package: 'Seaside-GemStone-Welcome'
          with: 'Seaside-GemStone-Welcome-DaleHenrichs.1';
        package: 'Seaside-RenderLoop'
          with: 'Seaside-RenderLoop.gemstone-dkh.74';
        package: 'Seaside-Session' with: 'Seaside-Session.gemstone-dkh.158';
        package: 'Seaside-Tests-GemStone-Continuation'
          with: 'Seaside-Tests-GemStone-Continuation-DaleHenrichs.12';
        package: 'Seaside-Tests-GemStone-Core'
          with: 'Seaside-Tests-GemStone-Core-dkh.15';
        package: 'Seaside-Tests-GemStone-Development'
          with: 'Seaside-Tests-GemStone-Development-DaleHenrichs.4';
        package: 'Seaside-Tests-GemStone-Flow'
          with: 'Seaside-Tests-GemStone-Flow-dkh.4';
        package: 'Seaside-Tests-GemStone-Functional'
          with: 'Seaside-Tests-GemStone-Functional-dkh.12';
        package: 'Seaside-Tests-RenderLoop'
          with: 'Seaside-Tests-RenderLoop.gemstone-dkh.13' ].
  spec
    for: #'gs2.4.x'
    do: [ 
      spec
        package: 'Seaside-GemStone240-Core'
        with: 'Seaside-GemStone240-Core-DaleHenrichs.3' ].
  spec
    for: #'gs3.x'
    do: [ 
      spec
        package: 'Seaside-GemStone300-Core'
        with: 'Seaside-GemStone300-Core-DaleHenrichs.4' ].
  spec
    for: #'gs3.1.x'
    do: [ spec package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow.310-dkh.12' ].
  spec
    for: #'gs3.2.x'
    do: [ 
      spec
        package: 'Seaside-GemStone-Core'
          with: 'Seaside-GemStone-Core.320-dkh.64';
        package: 'Seaside-GemStone-Flow'
          with: 'Seaside-GemStone-Flow.310-dkh.12';
        yourself ]