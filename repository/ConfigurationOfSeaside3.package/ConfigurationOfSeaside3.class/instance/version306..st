versions-30
version306: spec
	<version: '3.0.6' imports: #('3.0.6-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '3.0.6 (dkh.323):
- open 3.0.6 for development
- update to latest packages (http://code.google.com/p/seaside/wiki/Seaside306Changelog)
- update GRPlatform seaside version to 3.0.6
3.0.6 (dkh.324):
- add Zinc adaptor as part of Core
3.0.6 (dkh.325) [GEMSTONE]:
- Swazoo 2.2.0.4 for GemStone
- pick up recent GemStone packages
3.0.6 (dkh.326) [GEMSTONE]:
- merge JQuery-UI.gemstone-JohanBrichau.77, JQuery-UI-lr.80
- merge Seaside-Canvas.gemstone-DaleHenrichs.106, Seaside-Canvas-pmm.117
- merge Seaside-Core.gemstone-dkh.714, Seaside-Core-dkh.750
- merge Seaside-Session.gemstone-dkh.140, Seaside-Session-lr.142
- pick up GsCore 0.245
3.0.6 (dkh.327) [GEMSTONE]:
- exclude Zinc-Seaside (Zinc adaptor) from default group
- gemstone-specific bugfix for Issue 658: Seaside-Email should use request handler for configuration look up
  http://code.google.com/p/seaside/issues/detail?id=658
3.0.6 (dkh.328) [GEMSTONE]:
- fix Issue 274: Seaside-GemStone-ServiceTask
  http://code.google.com/p/glassdb/issues/detail?id=274
- fix Issue 273: Squeak-dkh.258 gives FastCGI error: InterpreterError 2192: End of stream was encountered in ReadStream
  http://code.google.com/p/glassdb/issues/detail?id=273
- fix Issue 272: GRGemStonePlatform>>seasideDeliverEmailMessage includes too much in mail message and missing subject
  http://code.google.com/p/glassdb/issues/detail?id=272'.
		spec author: 'dkh'.
		spec timestamp: '09/02/2011 17:07:39'.
		spec 
			project: 'Grease Core' with: '1.0.6';
			project: 'Grease Core Tests' with: '1.0.6';
			project: 'Swazoo2' with: '2.3.0.0';
			project: 'Zinc' with: '1.2'.
		spec 
			package: 'Javascript-Core' with: 'Javascript-Core-lr.90';
			package: 'JQuery-Core' with: 'JQuery-Core-lr.121';
			package: 'JQuery-UI' with: 'JQuery-UI-lr.80';
			package: 'Prototype-Core' with: 'Prototype-Core-lr.25';
			package: 'RSS-Core' with: 'RSS-Core-lr.67';
			package: 'RSS-Examples' with: 'RSS-Examples-lr.26';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-pmm.102';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-lr.111';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-pmm.117';
			package: 'Seaside-Component' with: 'Seaside-Component-jok.92';
			package: 'Seaside-Core' with: 'Seaside-Core-dkh.750';
			package: 'Seaside-Development' with: 'Seaside-Development-pmm.156';
			package: 'Seaside-Email' with: 'Seaside-Email-lr.21';
			package: 'Seaside-Environment' with: 'Seaside-Environment-pmm.76';
			package: 'Seaside-Examples' with: 'Seaside-Examples-lr.23';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-pmm.26';
			package: 'Seaside-Flow' with: 'Seaside-Flow-pmm.23';
			package: 'Seaside-HTML5' with: 'Seaside-HTML5-lr.23';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-pmm.7';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-lr.73';
			package: 'Seaside-Session' with: 'Seaside-Session-lr.142';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-lr.19';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-lr.26';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-lr.25';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-pmm.108';
			package: 'Seaside-Welcome' with: 'Seaside-Welcome-pmm.39';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-pmm.63';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-jf.19';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-pmm.41';
			package: 'Zinc-Seaside' with: 'Zinc-Seaside-lr.18';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-lr.130';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-pmm.82';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-lr.13';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-lr.30';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-pmm.61';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-lr.39';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-pmm.57';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-jok.33';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-pmm.253';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-pmm.43';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-lr.14';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-lr.27';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-lr.9';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-lr.13';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-spd.33';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-pmm.142';
			package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-pmm.26';
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
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-lr.13';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-pmm.55';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-lr.13';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-lr.6';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-pmm.38';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.11';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.14';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.8';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.25';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-lr.16';
			package: 'Seaside-Tests-Pharo-Email' with: 'Seaside-Tests-Pharo-Email-pmm.1';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-lr.13'. ].

	spec for: #'squeak' do: [
		spec package: 'Seaside-Squeak-Welcome' with: 'Seaside-Squeak-Welcome-NickAger.1'. ].

	spec for: #'pharo' do: [
		spec 
			project: 'Grease Slime' with: '1.0.6';
			project: 'Grease Slime Tests' with: '1.0.6'.
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-jok.80';
			package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-lr.42'. ].

	spec for: #'gemstone' do: [
		spec 
			project: 'GsCore' with: '0.245';
			project: 'FastCGI' with: '0.234';
			project: 'OB' with: #'stable';
			project: 'Swazoo2' with: '2.2.0.4'.
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-DaleHenrichs.4';
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-dkh.81';
			package: 'Seaside-Adaptors-FastCGI' with: 'Seaside-Adaptors-FastCGI-DaleHenrichs.25';
			package: 'Seaside-Core' with: 'Seaside-Core.gemstone-dkh.751';
			package: 'Seaside-GemStone-Adaptors-Swazoo' with: 'Seaside-GemStone-Adaptors-Swazoo-DaleHenrichs.4';
			package: 'Seaside-GemStone-Adaptors-Zinc' with: 'Seaside-GemStone-Adaptors-Zinc-PaulDeBruicker.4';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone-dkh.118';
			package: 'Seaside-GemStone-Basic-Development' with: 'Seaside-GemStone-Basic-Development-NickAger.25';
			package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-DaleHenrichs.20';
			package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-dkh.62';
			package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-DaleHenrichs.23';
			package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-DaleHenrichs.7';
			package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-dkh.12';
			package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-DaleHenrichs.11';
			package: 'Seaside-GemStone-Session' with: 'Seaside-GemStone-Session-DaleHenrichs.3';
			package: 'Seaside-GemStone-ServiceTask' with: 'Seaside-GemStone-ServiceTask-NickAger.20';
			package: 'Seaside-GemStone-Tools-Production' with: 'Seaside-GemStone-Tools-Production-dkh.12';
			package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-DaleHenrichs.4';
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-DaleHenrichs.4';
			package: 'Seaside-GemStone-Welcome' with: 'Seaside-GemStone-Welcome-DaleHenrichs.1';
			package: 'Seaside-Session' with: 'Seaside-Session.gemstone-dkh.143';
			package: 'Seaside-Tests-GemStone-Continuation' with: 'Seaside-Tests-GemStone-Continuation-DaleHenrichs.12';
			package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-dkh.15';
			package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-DaleHenrichs.4';
			package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-DaleHenrichs.3';
			package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-DaleHenrichs.11'. ].

	spec for: #'gs2.4.x' do: [
		spec package: 'Seaside-GemStone240-Core' with: 'Seaside-GemStone240-Core-DaleHenrichs.3'. ].

	spec for: #'gs3.x' do: [
		spec package: 'Seaside-GemStone300-Core' with: 'Seaside-GemStone300-Core-DaleHenrichs.4'. ].
