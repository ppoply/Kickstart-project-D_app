 pragma solidity ^0.4.17;
 
 contract CampaignFactory {
     // Factory contract for creating instances of new Campaigns
     address[] public deployedCampaigns;
     
     function createCampaign(uint minimum) public {
         address newCampaign = new Campaign(minimum,msg.sender);
         deployedCampaigns.push(newCampaign);
     }
     
     function getDeployedCampaigns() public view returns (address[]) {
         return deployedCampaigns;
     }
 }
 
 contract Campaign {
     
     struct Request {
         string description;
         uint value;
         address recipient;
         bool complete;
         uint approvalCount;
         mapping(address => bool) approvals; // mapping for people who have voted
     }
     
     Request[] public requests;
     address public manager;
     uint public minimumContribution;
     mapping(address => bool) public approvers;
     uint public approversCount;
     
     modifier restricted() {
         require(msg.sender == manager);
         _;
     }
     
     constructor(uint minimum, address creator) public {
         manager = creator;
         minimumContribution = minimum;
     }
     
     function contribute() public payable {
         require(msg.value > minimumContribution); 
         
         approvers[msg.sender] = true;     // Adding a new key (not actually) to the mapping with value true
         approversCount++;
     }                                  
     
     function createRequest(string description, uint value, address recipient) public restricted {
         Request memory newRequest = Request({
             description: description,
             value: value,
             recipient: recipient,
             complete: false,
             approvalCount: 0
         });
        // Alternative (ordered instance)
        // Request newRequest = Request(description,value,recipient,false,0);
         requests.push(newRequest);
     }
     
     function approveRequest(uint index) public {
         
         Request storage request = requests[index];
         
         require(approvers[msg.sender]);    // Checking whether the the person is a legit contributor 
         require(!request.approvals[msg.sender]);   // Checking whether the person hasn't already voted on the same request
         
         request.approvals[msg.sender] = true;  // Marking that the person has voted
         request.approvalCount++;  // Updating approvals count
     }
     
     function finalizeRequest(uint index) public restricted {
         
         Request storage request = requests[index];
         
         require(!request.complete);    // Checking whether request already completed or not
         require(request.approvalCount > (approversCount/2));   // Checking whether approvalCount > 50% 

         request.recipient.transfer(request.value); // transfering money to recipient
         request.complete = true;  
         
     }
     
 }