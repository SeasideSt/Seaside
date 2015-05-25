rendering
renderLetterListOn: html
	html select
		id: 'letter-list';
		size: 3;
		selected: letter;
		list: (Array with: $A with: $B with: $C);
		callback: [ :value | letter := value ]