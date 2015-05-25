tests
testLoad
	self
		assert: ((self jQuery: 'li') load)
		equals: self function , '("li").load("/")'.
	self
		assert: ((self jQuery: 'li') load 
			selector: '#jq-p-Getting-Started li')
		equals: self function , '("li").load("/ #jq-p-Getting-Started li")'.
	self
		assert: ((self jQuery: 'li') load 
			url: '/Main_Page';
			selector: '#jq-p-Getting-Started li')
		equals: self function , '("li").load("/Main_Page #jq-p-Getting-Started li")'