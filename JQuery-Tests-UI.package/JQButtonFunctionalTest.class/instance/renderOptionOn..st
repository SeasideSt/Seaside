rendering
renderOptionOn: html
	html span
		script: (html jQuery this buttonset);
		with: [ 
			html radioGroup
				selected: number; 
				callback: [ :value | number := value ];
				with: [ :group |
					#(1 2 3) do: [ :each |
						group radioButton
							onChange: (html jQuery ajax serializeForm);
							value: each;
							ensureId.
						html label
							for: html lastId;
							with: each ] ] ]