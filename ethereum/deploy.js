// Real Contract deployment file

const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const compiledFactory = require('./build/CampaignFactory.json');

// Setting up Provider 

const provider = new HDWalletProvider(
	'survey hospital fun huge vehicle quarter major purpose federal dolphin water black',
	'https://rinkeby.infura.io/c37a4573e4874debb6aeca6f570638df');

const web3 = new Web3(provider);

const deploy = async () => {
	const accounts = await web3.eth.getAccounts();

	console.log('Attempting to deploy from account',accounts[0]);

	const result = await new web3.eth.Contract(JSON.parse(compiledFactory.interface))
		.deploy({ data: '0x' + compiledFactory.bytecode })
		.send({ gas: '1000000', from: accounts[0] });

	console.log('Contract deployed to',result.options.address);
};
deploy();