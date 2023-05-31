// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;
// using this version because to make error handling on integer rollover..

// exceptions are used for error handling in sol

contract except_require_contract
{
    mapping(address=>uint)public balance_recieved;

    function recive_money()public payable
    {
        balance_recieved[msg.sender]+=msg.value;
    }

    function withdraw_money(address payable to,uint amount)public
    {
        // if this is true then the following code will execute , else the print stat will execute then the remaining will not execute
        require(amount<=balance_recieved[msg.sender],"Not enough fund in the wallet!!!");
        balance_recieved[msg.sender]-=amount;
        to.transfer(amount);
    }

}