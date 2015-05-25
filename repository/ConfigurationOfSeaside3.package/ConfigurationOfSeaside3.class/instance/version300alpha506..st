versions-30
version300alpha506: spec
	<version: '3.0.0-alpha5.6' imports: #('3.0.0-alpha5.6-baseline' )>

	spec for: #common do: [
		spec blessing: #alpha.
		spec description: '- pick up latest developer package versions (1/22/2010 12:06)"
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '1/26/2010 15:35'.
		spec 
			project: 'Grease' with: '1.0-alpha4';
			project: 'Grease Tests' with: '1.0-alpha4';
			project: 'Swazoo2' with: '2.2.0.1'.
		spec 
			package: 'Javascript-Core' with: 'Javascript-Core-jf.72';
			package: 'JQuery-Core' with: 'JQuery-Core-lr.94';
			package: 'JQuery-UI' with: 'JQuery-UI-jf.46';
			package: 'Prototype-Core' with: 'Prototype-Core-lr.15';
			package: 'RSS-Core' with: 'RSS-Core-pmm.57';
			package: 'RSS-Examples' with: 'RSS-Examples-pmm.22';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-lr.95';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-jf.95';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-obi.86';
			package: 'Seaside-Component' with: 'Seaside-Component-jf.81';
			package: 'Seaside-Core' with: 'Seaside-Core-obi.600';
			package: 'Seaside-Development' with: 'Seaside-Development-obi.127';
			package: 'Seaside-Email' with: 'Seaside-Email-dkh.14';
			package: 'Seaside-Environment' with: 'Seaside-Environment-lr.66';
			package: 'Seaside-Examples' with: 'Seaside-Examples-jf.15';
			package: 'Seaside-Flow' with: 'Seaside-Flow-jf.19';
			package: 'Seaside-HTML5' with: 'Seaside-HTML5-jf.7';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-jf.5';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-jf.70';
			package: 'Seaside-Session' with: 'Seaside-Session-lr.126';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-lr.14';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-jf.11';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-jf.12';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-jok.72';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-jf.46';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-lr.17';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-lr.32';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-lr.105';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-jf.62';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-jf.5';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-jf.21';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-jf.45';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-jf.28';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-obi.42';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-lr.27';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-obi.175';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-lr.33';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-lr.7';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-lr.20';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-lr.7';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-jf.22';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-obi.108';
			package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-lr.15';
			package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-jf.8';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-lr.10';
			package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-jf.33';
			package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-lr.13';
			package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-pmm.7'.].
	spec for: #squeakCommon do: [
		spec 
			project: 'Kom' with: '1.0';
			project: 'OB' with: '1.1';
			project: 'SPort2' with: '2.31'.
		spec 
			package: 'Comet-Core' with: 'Comet-Core-jf.44';
			package: 'Comet-Examples' with: 'Comet-Examples-lr.16';
			package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-jf.3';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-lr.3';
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-jf.52';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-lr.20';
			package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-jf.2';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.4';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-jf.3';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-jf.27';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-dkh.5';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.5';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-jf.3';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-lr.4';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-obi.12';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-jf.7';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-lr.12';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-lr.12';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.5';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-dkh.6';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-jf.6';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-jf.8'.].
	spec for: #pharo do: [
		spec project: 'Refactoring-Core' with: '1.1'.
		spec
			package: 'Seaside-Slime' with: 'Seaside-Slime-lr.70';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-lr.34'.].
	spec for: #gemstone do: [
		spec blessing: #broken.
		spec description: 'NOT PORTED TO GEMSTONE'.
		spec 
			project: 'Grease' with: '1.0-alpha3';
			project: 'Grease Tests' with: '1.0-alpha3';
			project: 'FastCGI' with: '0.234';
			project: 'OB' with: '0.235'.
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-dkh.1';
			package: 'JQuery-Core' with: 'JQuery-Core.gemstone-dkh.91';
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-dkh.43';
			package: 'Prototype-Core' with: 'Prototype-Core.gemstone-dkh.13';
			package: 'Seaside-Adaptors-FastCGI' with: 'Seaside-Adaptors-FastCGI-dkh.14';
			package: 'Seaside-GemStone-Adaptors-Swazoo' with: 'Seaside-GemStone-Adaptors-Swazoo-dkh.2';
			package: 'Seaside-Core' with: 'Seaside-Core.gemstone-dkh.595';
			package: 'Seaside-GemStone-Basic-Development' with: 'Seaside-GemStone-Basic-Development-dkh.14';
			package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-dkh.44';
			package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-dkh.3';
			package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-dkh.5';
			package: 'Seaside-GemStone-Session' with: 'Seaside-GemStone-Session-dkh.2';
			package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-dkh.3';
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-dkh.2';
			package: 'Seaside-Session' with: 'Seaside-Session.gemstone-dkh.125';
			package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-dkh.11';
			package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-dkh.8'.].
	spec for: #'gs2.3.x' do: [
		spec 
			removePackage: 'JQuery-Tests-Core';
			removePackage: 'JQuery-Tests-UI';
			removePackage: 'Scriptaculous-Components';
			removePackage: 'Scriptaculous-Tests-Components';
			removePackage: 'Seaside-Development';
			removePackage: 'Seaside-Flow';
			removePackage: 'Seaside-Tests-Development';
			removePackage: 'Seaside-Tests-Flow'.].
	spec for: #'gs2.4.x' do: [
		spec 
			package: 'JQuery-Tests-GemStone-Core' with: 'JQuery-Tests-GemStone-Core-dkh.1';
			package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-dkh.19';
			package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-dkh.9';
			package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-dkh.6';
			package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-dkh.3';
			package: 'Seaside-Tests-GemStone-Continuation' with: 'Seaside-Tests-GemStone-Continuation-dkh.9';
			package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-dkh.1'.].