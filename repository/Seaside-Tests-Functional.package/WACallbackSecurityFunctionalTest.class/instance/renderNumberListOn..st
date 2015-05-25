rendering
renderNumberListOn: html
	html select
		id: 'number-list';
		size: 3;
		selected: number;
		list: (Array with: 1 with: 2 with: 3);
		callback: [ :value | number := value ]