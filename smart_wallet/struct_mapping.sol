// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15;

// code which uses both struct and mapping...

contract struct_mapping
{
    struct transaction
    {
        uint amount;
        uint timestamp;
    }

    struct struct_balance
    {
        uint total_balance;

        uint num_deposits;
        mapping(uint=>transaction) deposits;


        uint num_withdrawls;
        mapping(uint=>transaction) withdrawals;

    }


    mapping(address=>struct_balance)public  balances;

    function deposit_money()public payable
    {
        // setting the total balance of the contract 
        balances[msg.sender].total_balance+=msg.value;
        
        // creating a temp memory for the transaction called deposit (amount , timestamp)
        transaction memory deposit =transaction(msg.value,block.timestamp);

        // setting num_deposits which is present in the struct_balance
        balances[msg.sender].deposits[balances[msg.sender].num_deposits]=deposit;

        // incrementing the num_deposits by 1 every time you call this function
        balances[msg.sender].num_deposits++;

    }

    function withdraw_money(address payable to,uint in_amount)public
    {
        // deducting the total balance by the entered amount...
        balances[msg.sender].total_balance-=in_amount;
    
        // creating a temp memory for the transaction called withdrawal (amount , timestamp)
        transaction memory withdrawal=transaction(in_amount,block.timestamp);

        // setting number of withdrawals 
        balances[msg.sender].withdrawals[balances[msg.sender].num_withdrawls]=withdrawal;

        // transfering the amount from the contract to the (to)address  
        to.transfer(in_amount);
    }
}