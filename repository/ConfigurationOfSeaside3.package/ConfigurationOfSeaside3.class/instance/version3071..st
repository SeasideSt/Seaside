versions-30
version3071: spec
	<version: '3.0.7.1' imports: #('3.0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '3.0.7.1 (dkh.374)
- port Seaside3.0.7 to GemStone 3.1
- GSProcess>>_callUnwindBlocks not used in GemStone 3.1
3.0.7.1 (dkh.375):
- need to use Grease 1.0.7.1 for GemStone 3.1
3.0.7.1 (dkh.377)
- fix test issue for GemStone related to issue 353 - UTF8 tests failing in 3.1.0.1
  http://code.google.com/p/glassdb/issues/detail?id=353'.
		spec 
			project: 'Grease Core' with: '1.0.7.2';
			project: 'Grease Core Tests' with: '1.0.7.2';
			project: 'Swazoo2' with: '2.3.0.0';
			project: 'Zinc' with: #'stable'.
		spec 
			package: 'Javascript-Core' with: 'Javascript-Core-lr.90';
			package: 'JQuery-Core' with: 'JQuery-Core-lr.123';
			package: 'JQuery-UI' with: 'JQuery-UI-lr.80';
			package: 'Prototype-Core' with: 'Prototype-Core-lr.25';
			package: 'RSS-Core' with: 'RSS-Core-lr.67';
			package: 'RSS-Examples' with: 'RSS-Examples-lr.26';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-pmm.102';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-lr.111';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-pmm.117';
			package: 'Seaside-Component' with: 'Seaside-Component-jok.92';
			package: 'Seaside-Core' with: 'Seaside-Core-NickAger.768';
			package: 'Seaside-Development' with: 'Seaside-Development-pmm.156';
			package: 'Seaside-Email' with: 'Seaside-Email-lr.21';
			package: 'Seaside-Environment' with: 'Seaside-Environment-NickAger.77';
			package: 'Seaside-Examples' with: 'Seaside-Examples-lr.23';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-pmm.26';
			package: 'Seaside-Flow' with: 'Seaside-Flow-pmm.23';
			package: 'Seaside-HTML5' with: 'Seaside-HTML5-pmm.28';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-pmm.7';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-lr.73';
			package: 'Seaside-Session' with: 'Seaside-Session-pmm.157';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-lr.19';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-lr.26';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-lr.25';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-NickAger.113';
			package: 'Seaside-Welcome' with: 'Seaside-Welcome-NickAger.40';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-pmm.63';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-pmm.20';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-pmm.42';
			package: 'Zinc-Seaside' with: 'Zinc-Seaside-SvenVanCaekenberghe.22';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-NickAger.132';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-pmm.82';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-lr.13';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-lr.30';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-pmm.61';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-lr.39';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-dkh.58';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-jok.33';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-NickAger.257';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-pmm.43';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-lr.14';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-lr.27';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-lr.9';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-lr.13';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-dkh.34';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-pmm.142';
			package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-pmm.28';
			package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-lr.9';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-lr.11';
			package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-lr.49';
			package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-lr.18';
			package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-lr.10';
			package: 'Seaside-Tests-Welcome' with: 'Seaside-Tests-Welcome-lr.6'. ].

	spec for: #'squeakCommon' do: [
		spec 
			project: 'Kom' with: '1.0.9';
			project: 'OB' with: #'stable';
			project: 'SPort2' with: '2.31'.
		spec 
			package: 'Comet-Core' with: 'Comet-Core-lr.51';
			package: 'Comet-Examples' with: 'Comet-Examples-lr.23';
			package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-lr.6';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-DaleHenrichs.9';
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-lr.70';
			package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-lr.3';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-NickAger.16';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-lr.57';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-lr.13';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser.pharoOB-NickAger.7';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-NickAger.39';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.11';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.14';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.8';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.25';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-pmm.18';
			package: 'Seaside-Tests-Pharo-Email' with: 'Seaside-Tests-Pharo-Email-pmm.1';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-lr.13'. ].

	spec for: #'squeak' do: [
		spec package: 'Seaside-Squeak-Welcome' with: 'Seaside-Squeak-Welcome-NickAger.1'. ].

	spec for: #'pharo' do: [
		spec 
			project: 'Grease Slime' with: '1.0.7.2';
			project: 'Grease Slime Tests' with: '1.0.7.2'.
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-lr.82';
			package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-lr.42'. ].

	spec for: #'pharo1.4.x' do: [
		spec project: 'Kom' with: '1.1.0'. ].

	spec for: #'pharo1.0.x' do: [
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-jok.80'. ].

	spec for: #'gemstone' do: [
		spec 
			project: 'GsCore' with: '0.246';
			project: 'FastCGI' with: '0.235';
			project: 'OB' with: #'stable';
			project: 'Swazoo2' with: '2.2.0.4';
			project: 'Zinc' with: '1.1'.
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-DaleHenrichs.4';
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-dkh.81';
			package: 'Seaside-Adaptors-FastCGI' with: 'Seaside-Adaptors-FastCGI-dkh.26';
			package: 'Seaside-Core' with: 'Seaside-Core.gemstone-dkh.769';
			package: 'Seaside-GemStone-Adaptors-Swazoo' with: 'Seaside-GemStone-Adaptors-Swazoo-dkh.5';
			package: 'Seaside-GemStone-Adaptors-Zinc' with: 'Seaside-GemStone-Adaptors-Zinc-PaulDeBruicker.4';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone-dkh.119';
			package: 'Seaside-GemStone-Basic-Development' with: 'Seaside-GemStone-Basic-Development-NickAger.25';
			package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-DaleHenrichs.20';
			package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-dkh.63';
			package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-dkh.27';
			package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-dkh.12';
			package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-topa.13';
			package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-DaleHenrichs.11';
			package: 'Seaside-GemStone-Session' with: 'Seaside-GemStone-Session-DaleHenrichs.3';
			package: 'Seaside-GemStone-ServiceTask' with: 'Seaside-GemStone-ServiceTask-NickAger.20';
			package: 'Seaside-GemStone-Tools-Production' with: 'Seaside-GemStone-Tools-Production-dkh.13';
			package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-DaleHenrichs.4';
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-DaleHenrichs.4';
			package: 'Seaside-GemStone-Welcome' with: 'Seaside-GemStone-Welcome-DaleHenrichs.1';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop.gemstone-dkh.74';
			package: 'Seaside-Session' with: 'Seaside-Session.gemstone-dkh.158';
			package: 'Seaside-Tests-GemStone-Continuation' with: 'Seaside-Tests-GemStone-Continuation-DaleHenrichs.12';
			package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-dkh.15';
			package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-DaleHenrichs.4';
			package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-dkh.4';
			package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-dkh.12';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop.gemstone-dkh.13'. ].

	spec for: #'gs2.4.x' do: [
		spec package: 'Seaside-GemStone240-Core' with: 'Seaside-GemStone240-Core-DaleHenrichs.3'. ].

	spec for: #'gs3.x' do: [
		spec package: 'Seaside-GemStone300-Core' with: 'Seaside-GemStone300-Core-DaleHenrichs.4'. ].
	spec for: #'gs3.1.x' do: [
		spec package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow.310-dkh.12' ].
	spec for: #'gs3.2.x' do: [
		spec package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow.310-dkh.12' ]
	