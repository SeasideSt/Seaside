rendering
renderPackageSearchOn: html

	html form
		get;
		turboTarget: packagesPane turboframeId;
		with: [ 
			html searchInput
				style: 'height: 2.5em';
				placeholder: 'Search...';
				onInput: (html javascript: 'this.form.requestSubmit()');
				callback: [ :value | self searchTerm: value ];
				value: searchTerm ]