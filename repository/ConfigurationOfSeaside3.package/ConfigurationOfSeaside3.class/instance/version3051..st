versions-30
version3051: spec
	<version: '3.0.5.1' imports: #('3.0.5.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '3.0.5.1 (dkh.317):
- open 3.0.5.1 for development... GemStone-specific branch aimed at bypassing use of class instance variables (etc.) to allow the GemStone 3.0 version of Seaside to run against a read only SymbolDictionary. Some class instance variables are mapped to session temps and some are mapped to user-specific storage in UserGlobals.
- class instance variables in WADispatcher, WAFileHandler, WAFileLibrary, WASharedConfiguration, WASystemConfiguration, WAEnvironment and WAAdmin mapped to persistent per-user storage
- class instance variables in WAKeyGenerator mapped to session state
- fix WAGemStoneMaintenanceTask class>>maintenanceTaskMarkForCollect will work in GemStone 2.x and 3.x
3.0.5.1 (dkh.318):
- pick up fix for Issue 674: WASwazooAdaptor decodes an already decoded URI
- http://code.google.com/p/seaside/issues/detail?id=674'.
		spec author: 'dkh'.
		spec timestamp: '08/09/2011 11:21:39'.
		spec 
			project: 'Grease Core' with: '1.0.5.1';
			project: 'Grease Core Tests' with: '1.0.5.1';
			project: 'Swazoo2' with: '2.3.0.0'.
		spec 
			package: 'Javascript-Core' with: 'Javascript-Core-pmm.89';
			package: 'JQuery-Core' with: 'JQuery-Core-lr.118';
			package: 'JQuery-UI' with: 'JQuery-UI-lr.75';
			package: 'Prototype-Core' with: 'Prototype-Core-lr.24';
			package: 'RSS-Core' with: 'RSS-Core-pmm.65';
			package: 'RSS-Examples' with: 'RSS-Examples-lr.24';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-pmm.99';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-pmm.108';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-pmm.108';
			package: 'Seaside-Component' with: 'Seaside-Component-pmm.87';
			package: 'Seaside-Core' with: 'Seaside-Core-pmm.712';
			package: 'Seaside-Development' with: 'Seaside-Development-pmm.148';
			package: 'Seaside-Email' with: 'Seaside-Email-pmm.19';
			package: 'Seaside-Environment' with: 'Seaside-Environment-pmm.74';
			package: 'Seaside-Examples' with: 'Seaside-Examples-pmm.22';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-pmm.26';
			package: 'Seaside-Flow' with: 'Seaside-Flow-pmm.23';
			package: 'Seaside-HTML5' with: 'Seaside-HTML5-pmm.22';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-pmm.7';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-lr.72';
			package: 'Seaside-Session' with: 'Seaside-Session-pmm.138';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-jf.18';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-pmm.21';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-pmm.21';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-pmm.100';
			package: 'Seaside-Welcome' with: 'Seaside-Welcome-pmm.35';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-pmm.63';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-jf.19';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-pmm.41';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-lr.128';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-pmm.80';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-lr.12';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-pmm.28';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-pmm.59';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-pmm.36';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-pmm.53';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-NickAger.31';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-lr.219';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-pmm.38';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-pmm.11';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-pmm.25';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-lr.9';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-lr.13';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-pmm.29';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-pmm.133';
			package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-pmm.22';
			package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-lr.9';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-lr.11';
			package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-pmm.44';
			package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-pmm.17';
			package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-lr.9';
			package: 'Seaside-Tests-Welcome' with: 'Seaside-Tests-Welcome-NickAger.4'. ].

	spec for: #'squeakCommon' do: [
		spec 
			project: 'Kom' with: '1.0.9';
			project: 'OB' with: #'stable';
			project: 'SPort2' with: '2.31'.
		spec 
			package: 'Comet-Core' with: 'Comet-Core-lr.51';
			package: 'Comet-Examples' with: 'Comet-Examples-lr.22';
			package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-lr.6';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-DaleHenrichs.9';
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-pmm.68';
			package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-lr.3';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-pmm.12';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-lr.50';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-pmm.10';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-lr.6';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-pmm.29';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.11';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.14';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.7';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.19';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-dkh.14';
			package: 'Seaside-Tests-Pharo-Email' with: 'Seaside-Tests-Pharo-Email-pmm.1';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-lr.12'. ].

	spec for: #'squeak' do: [
		spec package: 'Seaside-Squeak-Welcome' with: 'Seaside-Squeak-Welcome-NickAger.1'. ].

	spec for: #'pharo' do: [
		spec 
			project: 'Grease Slime' with: '1.0.5.1';
			project: 'Grease Slime Tests' with: '1.0.5.1'.
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-lr.78';
			package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-lr.42'. ].

	spec for: #'pharo1.2.x' do: [
		spec blessing: #'development'. ].

	spec for: #'pharo1.3.x' do: [
		spec blessing: #'development'. ].

	spec for: #'gemstone' do: [
		spec 
			project: 'GsCore' with: '0.245';
			project: 'FastCGI' with: '0.234';
			project: 'OB' with: #'stable';
			project: 'Swazoo2' with: '2.2.0.4'.
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-DaleHenrichs.4';
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-JohanBrichau.77';
			package: 'Seaside-Adaptors-FastCGI' with: 'Seaside-Adaptors-FastCGI-DaleHenrichs.25';
			package: 'Seaside-Core' with: 'Seaside-Core.gemstone-dkh.713';
			package: 'Seaside-Environment' with: 'Seaside-Environment.gemstone-dkh.75';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core.gemstone-dkh.19';
			package: 'Seaside-GemStone-Adaptors-Swazoo' with: 'Seaside-GemStone-Adaptors-Swazoo-DaleHenrichs.4';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone-DaleHenrichs.106';
			package: 'Seaside-GemStone-Basic-Development' with: 'Seaside-GemStone-Basic-Development-NickAger.25';
			package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-DaleHenrichs.20';
			package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-dkh.62';
			package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-DaleHenrichs.23';
			package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-DaleHenrichs.7';
			package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-dkh.9';
			package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-DaleHenrichs.11';
			package: 'Seaside-GemStone-Session' with: 'Seaside-GemStone-Session-DaleHenrichs.3';
			package: 'Seaside-GemStone-ServiceTask' with: 'Seaside-GemStone-ServiceTask-NickAger.16';
			package: 'Seaside-GemStone-Tools-Production' with: 'Seaside-GemStone-Tools-Production-dkh.12';
			package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-DaleHenrichs.4';
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-DaleHenrichs.4';
			package: 'Seaside-GemStone-Welcome' with: 'Seaside-GemStone-Welcome-DaleHenrichs.1';
			package: 'Seaside-Session' with: 'Seaside-Session.gemstone-dkh.140';
			package: 'Seaside-Tests-GemStone-Continuation' with: 'Seaside-Tests-GemStone-Continuation-DaleHenrichs.12';
			package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-dkh.15';
			package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-DaleHenrichs.4';
			package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-DaleHenrichs.3';
			package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-DaleHenrichs.11'. ].

	spec for: #'gs2.4.x' do: [
		spec package: 'Seaside-GemStone240-Core' with: 'Seaside-GemStone240-Core-DaleHenrichs.3'. ].

	spec for: #'gs3.x' do: [
		spec package: 'Seaside-GemStone300-Core' with: 'Seaside-GemStone300-Core-DaleHenrichs.4'. ].
