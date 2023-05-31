(async()=> {
    const address="0xa131AD247055FD2e2aA8b156A11bdEc81b9eAD95";
    const abi_array=[
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "new_uint",
				"type": "uint256"
			}
		],
		"name": "set_my_int",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "my_uint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];
    const contract_instance=new web3.eth.Contract(abi_array,address);

    // getting the value of the uint from the smart contract 
    // console.log(await contract_instance.methods.my_uint().call());

   let accounts=await web3.eth.getAccounts();
   let result= await contract_instance.methods.set_my_int(169).send({from :accounts[0]});
   console.log(await contract_instance.methods.my_uint().call());
   console.log(result);
})()