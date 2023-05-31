( async()=>
{
    // console.log("hi_brooo....");
    // shows all the account present..
    let accounts=await web3.eth.getAccounts();
    console.log(accounts);
    console.log(accounts.length);


    // shows the balance present in the specific account
    let balance =await web3.eth.getBalance(accounts[0]) ;
    console.log("Balance present(wei): ",balance);

    // getting balance in ether.
    let balance_in_eth= web3.utils.fromwei(balance.tostring(),"ether");
    console.log(balance_in_eth);

})() 