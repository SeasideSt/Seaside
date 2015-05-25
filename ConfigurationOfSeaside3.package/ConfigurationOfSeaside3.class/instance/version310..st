versions-31
version310: spec
	<version: '3.1.0' imports: #('3.1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'released'.
		spec author: 'JohanBrichau'.
		spec timestamp: '12/31/2013 08:50'.
		spec 
			project: 'Grease' with: '1.1.5';
			project: 'Grease Core Tests' with: '1.1.5';
			project: 'SPort2' with: '2.33';
			project: 'Swazoo2' with: #'stable';
			project: 'Zinc Project' with: #'stable'.
		spec 
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-pmm.127';
			package: 'Seaside-Component' with: 'Seaside-Component-pmm.101';
			package: 'Seaside-Core' with: 'Seaside-Core-pmm.808';
			package: 'Seaside-Development' with: 'Seaside-Development-pmm.163';
			package: 'Seaside-Email' with: 'Seaside-Email-pmm.25';
			package: 'Seaside-Environment' with: 'Seaside-Environment-pmm.81';
			package: 'Seaside-Examples' with: 'Seaside-Examples-pmm.24';
			package: 'Seaside-Flow' with: 'Seaside-Flow-pmm.24';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-pmm.7';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-JohanBrichau.95';
			package: 'Seaside-Session' with: 'Seaside-Session-pmm.168';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-pmm.23';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-pmm.118';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-pmm.33';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-pmm.64';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-pmm.36';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-pmm.272';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-pmm.45';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-pmm.18';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-pmm.30';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-pmm.11';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-pmm.37';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-pmm.156';
			package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-lr.9';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-lr.13';
			package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-pmm.72';
			package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-pmm.23';
			package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-pmm.14';
			package: 'Javascript-Core' with: 'Javascript-Core-pmm.95';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-pmm.71';
			package: 'JQuery-Core' with: 'JQuery-Core-pmm.128';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-pmm.138';
			package: 'JQuery-JSON' with: 'JQuery-JSON-pmm.1';
			package: 'JQuery-Tests-JSON' with: 'JQuery-Tests-JSON-pmm.1';
			package: 'JQuery-UI' with: 'JQuery-UI-pmm.88';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-pmm.85';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-JohanBrichau.27';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-JohanBrichau.14';
			package: 'Seaside-JSON-Core' with: 'Seaside-JSON-Core-pmm.23';
			package: 'Seaside-Tests-JSON' with: 'Seaside-Tests-JSON-pmm.11';
			package: 'RSS-Core' with: 'RSS-Core-pmm.69';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-lr.30';
			package: 'Seaside-REST-Core' with: 'Seaside-REST-Core-pmm.52';
			package: 'Seaside-Tests-REST-Core' with: 'Seaside-Tests-REST-Core-JohanBrichau.31';
			package: 'RSS-Examples' with: 'RSS-Examples-pmm.27';
			package: 'Zinc-Seaside' with: 'Zinc-Seaside-SvenVanCaekenberghe.40';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-pmm.20';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-pmm.44';
			package: 'Comet-Core' with: 'Comet-Core-pmm.55';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.11';
			package: 'Comet-Examples' with: 'Comet-Examples-pmm.26';
			package: 'Prototype-Core' with: 'Prototype-Core-pmm.28';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-pmm.17';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-pmm.105';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-pmm.63';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-pmm.114';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-pmm.42';
			package: 'Seaside-Welcome' with: 'Seaside-Welcome-pmm.47';
			package: 'Seaside-Tests-Welcome' with: 'Seaside-Tests-Welcome-lr.6'. ].

	spec for: #'gs3.x' do: [
		spec
			baseline:'Seaside3' with: [ spec  repository: 'github://glassdb/Seaside31:gemstone3.1/repository' ];
			import: 'Seaside3' 
	 ].

	spec for: #'squeakCommon' do: [
		spec
			project: 'WebClient Project' with:  '1.5'.
		spec 
			package: 'WebClient-Seaside' with: 'WebClient-Seaside-ar.10';
			package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-pmm.4';
			package: 'Seaside-Tests-Pharo-Canvas' with: 'Seaside-Tests-Pharo-Canvas-pmm.1';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-JohanBrichau.66';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-pmm.9';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-JohanBrichau.33';
			package: 'Seaside-Tests-Pharo-Email' with: 'Seaside-Tests-Pharo-Email-pmm.1';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-pmm.15';
			package: 'Seaside-Pharo-JSON-Core' with: 'Seaside-Pharo-JSON-Core-pmm.2';
			package: 'Seaside-Tests-Pharo-JSON-Core' with: 'Seaside-Tests-Pharo-JSON-Core-pmm.1';
			package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-lr.6'. ].

	spec for: #(#'squeak' #'pharo1.x' ) do: [
		spec project: 'OB' with: #'stable'.
		spec 
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-pmm.49';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-pmm.23';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.30';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-pmm.15';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-pmm.16';
			package: 'Seaside-Pharo-REST-Core' with: 'Seaside-Pharo-REST-Core-pmm.7';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-lr.7';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-pmm.29' ].

	spec for: #'pharo1.x' do: [
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-pmm.85';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-pmm.44';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-JohanBrichau.12';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.15' ].

	spec for: #'pharo2.x' do: [
		spec 
			package: 'Seaside-Pharo20-Tools-Web' with: 'Seaside-Pharo20-Tools-Web-JohanBrichau.3';
			package: 'Seaside-Pharo20-Core' with: 'Seaside-Pharo20-Core-pmm.3';
			package: 'Seaside-Tests-Pharo20-Core' with: 'Seaside-Tests-Pharo20-Core-pmm.4';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-pmm.16';
			package: 'Seaside-Pharo20-REST-Core' with: 'Seaside-Pharo20-REST-Core-JohanBrichau.2';
			package: 'Seaside-Pharo-Tools-Spec' with: 'Seaside-Pharo-Tools-Spec-pmm.9';
			package: 'Javascript-Pharo20-Core' with: 'Javascript-Pharo20-Core-JohanBrichau.4';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1'. ].

	spec for: #'pharo3.x' do: [
		spec 
			package: 'Seaside-Pharo20-Tools-Web' with: 'Seaside-Pharo20-Tools-Web-JohanBrichau.3';
			package: 'Seaside-Pharo20-Core' with: 'Seaside-Pharo20-Core-pmm.3';
			package: 'Seaside-Tests-Pharo20-Core' with: 'Seaside-Tests-Pharo20-Core-pmm.4';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-pmm.16';
			package: 'Seaside-Pharo20-REST-Core' with: 'Seaside-Pharo20-REST-Core-JohanBrichau.2';
			package: 'Seaside-Pharo-Tools-Spec' with: 'Seaside-Pharo-Tools-Spec-pmm.9';
			package: 'Javascript-Pharo20-Core' with: 'Javascript-Pharo20-Core-JohanBrichau.4';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1'. ].

	spec for: #'pharo' do: [
		spec 
			project: 'Grease Slime' with: '1.1.5';
			project: 'Grease Slime Tests' with: '1.1.5'.
		spec 
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-pmm.79';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.15';
			package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2'. ].

	spec for: #'squeak' do: [
		spec 
			package: 'Seaside-Squeak-Welcome' with: 'Seaside-Squeak-Welcome-NickAger.1';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-JohanBrichau.12';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1'. ].
