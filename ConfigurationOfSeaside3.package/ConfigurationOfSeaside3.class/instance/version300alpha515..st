versions-30
version300alpha515: spec
	<version: '3.0.0-alpha5.15' imports: #('3.0.0-alpha5.15-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'port to GemStone GLASS 1.0-beta.8
  - remote debugging (disable ''Proceed'' for remote debugging until  Issue 128 is fixed: http://code.google.com/p/glassdb/issues/detail?id=128
  - object log tool
- pick up latest mcz files (6/21/2010 14:32)
- dependencies restructured
- fix Issue 573: http://code.google.com/p/seaside/issues/detail?id=573 "Javascript-Core extends the classes True and False, which don''t exist in GemStone"
- fix Issue 574: http://code.google.com/p/seaside/issues/detail?id=574 "MessageSend>>numArgs is part of PharoCore 1.0"
- added ''Base'' group as per discussion with Julian ... keeping ''Core'' group around (no change to it''s definition, yet)
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '07/13/10 16:55:35'.
		spec 
			project: 'Grease Core' with: '1.0-alpha9.3';
			project: 'Grease Core Tests' with: '1.0-alpha9.3';
			project: 'Swazoo2' with: '2.2.0.2'.
		spec 
			package: 'Javascript-Core' with: 'Javascript-Core-DaleHenrichs.87';
			package: 'JQuery-Core' with: 'JQuery-Core-lr.106';
			package: 'JQuery-UI' with: 'JQuery-UI-obi.58';
			package: 'Prototype-Core' with: 'Prototype-Core-lr.21';
			package: 'RSS-Core' with: 'RSS-Core-jok.60';
			package: 'RSS-Examples' with: 'RSS-Examples-lr.24';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-lr.96';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-obi.105';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-pmm.95';
			package: 'Seaside-Component' with: 'Seaside-Component-lr.82';
			package: 'Seaside-Core' with: 'Seaside-Core-pmm.648';
			package: 'Seaside-Development' with: 'Seaside-Development-jf.134';
			package: 'Seaside-Email' with: 'Seaside-Email-lr.15';
			package: 'Seaside-Environment' with: 'Seaside-Environment-lr.69';
			package: 'Seaside-Examples' with: 'Seaside-Examples-jok.18';
			package: 'Seaside-Flow' with: 'Seaside-Flow-lr.21';
			package: 'Seaside-HTML5' with: 'Seaside-HTML5-lr.9';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-lr.6';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-lr.72';
			package: 'Seaside-Session' with: 'Seaside-Session-jf.132';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-lr.17';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-obi.18';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-jf.15';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-obi.89';
			package: 'Seaside-Welcome' with: 'Seaside-Welcome-obi.12';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-lr.57';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-jf.19';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-pmm.37';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-obi.121';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-lr.77';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-lr.11';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-jok.24';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-lr.56';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-lr.33';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-pmm.49';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-lr.29';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-pmm.195';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-lr.35';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-lr.9';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-lr.23';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-lr.9';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-YM.27';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-obi.121';
			package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-pmm.17';
			package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-lr.9';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-lr.11';
			package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-pmm.39';
			package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-lr.15';
			package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-lr.9'.].
	spec for: #'squeakCommon' do: [
		spec 
			project: 'Kom' with: '1.0.2';
			project: 'OB' with: '1.1.4';
			project: 'SPort2' with: '2.31'.
		spec 
			package: 'Comet-Core' with: 'Comet-Core-lr.49';
			package: 'Comet-Examples' with: 'Comet-Examples-lr.19';
			package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-lr.6';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-DaleHenrichs.9';
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-pmm.59';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-lr.23';
			package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-lr.3';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-pmm.9';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-lr.42';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-lr.6';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-lr.6';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-lr.21';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.10';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-lr.13';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-lr.13';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.7';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.12';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-DaleHenrichs.13';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-lr.12'.].
	spec for: #'pharo' do: [
		spec 
			project: 'Grease Slime' with: '1.0-alpha9.3';
			project: 'Grease Slime Tests' with: '1.0-alpha9.3'.
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-lr.77';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-lr.42'.].
	spec for: #'gemstone' do: [
		spec 
			project: 'GsCore' with: '0.241';
			project: 'FastCGI' with: '0.234';
			project: 'OB' with: '0.239'.
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-DaleHenrichs.2';
			package: 'JQuery-Core' with: 'JQuery-Core.gemstone-DaleHenrichs.107';
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-DaleHenrichs.60';
			package: 'Prototype-Core' with: 'Prototype-Core.gemstone-DaleHenrichs.22';
			package: 'Seaside-Adaptors-FastCGI' with: 'Seaside-Adaptors-FastCGI-DaleHenrichs.21';
			package: 'Seaside-GemStone-Adaptors-Swazoo' with: 'Seaside-GemStone-Adaptors-Swazoo-DaleHenrichs.3';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone-DaleHenrichs.96';
			package: 'Seaside-Core' with: 'Seaside-Core.gemstone-DaleHenrichs.649';
			package: 'Seaside-GemStone-Basic-Development' with: 'Seaside-GemStone-Basic-Development-DaleHenrichs.24';
			package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-DaleHenrichs.54';
			package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-DaleHenrichs.6';
			package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-DaleHenrichs.6';
			package: 'Seaside-GemStone-Session' with: 'Seaside-GemStone-Session-DaleHenrichs.3';
			package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-DaleHenrichs.4';
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-DaleHenrichs.3';
			package: 'Seaside-Session' with: 'Seaside-Session.gemstone-DaleHenrichs.134';
			package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-DaleHenrichs.13';
			package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-DaleHenrichs.11'.].
	spec for: #'gs2.4.x' do: [
		spec 
			package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-DaleHenrichs.20';
			package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-DaleHenrichs.20';
			package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-DaleHenrichs.10';
			package: 'Seaside-GemStone-Tools-Production' with: 'Seaside-GemStone-Tools-Production-DaleHenrichs.7';
			package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-DaleHenrichs.4';
			package: 'Seaside-Tests-GemStone-Continuation' with: 'Seaside-Tests-GemStone-Continuation-DaleHenrichs.10';
			package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-DaleHenrichs.2'.].