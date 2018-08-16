import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
	JSON.parse(CampaignFactory.interface),
	'0xB8c85cEACF8e2626767A6b98b7FB8676FFeA48b5'
);

export default instance;