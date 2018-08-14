import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
	JSON.parse(CampaignFactory.interface),
	'0x5c056a1beDB870436d2b876485d99184f70dEE8E'
);

export default instance;