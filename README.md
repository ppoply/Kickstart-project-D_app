# Kickstart-project-d_app

<strong>A decentralised version of kickstarter.com</strong>

Specifications of the decentralised App :

- Anyone on the Ethereum network can create a campaign for Crowdfunding. All they need to do is specify the minimum contribution amount and create an instance of the Campaign.  
- Any individual contributing to a campaign will be considered as an (potential) approver of the campaign.
- The manager (the campaign creator) can make a transaction request regarding using the contract's balance for a given commodity/service. That request then will need to get approved by the campaign approvers (people who contributed to the campaign). 
- A request consists of an ID, A description, Amount to send, Recipient address and an approval count. A request only gets approved when more than half of the campaign approvers vote to approve the request. 
- Once a request gets sufficient amount of approvals then the manager of the campaign can finalize that request. Upon finalizing the request the transaction specified in the request is finally completed.
- This model solves most of the problems that are faced by kickstarter.com since the campaign contributors have control over their money in some way. There are some other problems that are faced by this model solutions to which are currently being worked upon. 
- For the Interface React.js has been used just for the sake of the developers ease. Also Next.js has been used for dynamic routing. 
- Proper measures have been taken upon handling validation errors. This project is far from complete. Changes will keep on coming in the near future.

<strong> Note : This whole project is part of Udemy's "Ethereum and Solidity: The Complete Developer's Guide" course by Stephen Grider.</strong>
