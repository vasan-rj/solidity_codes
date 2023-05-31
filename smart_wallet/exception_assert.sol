// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

contract except_require_contract
{
    mapping(address=>uint8)public balance_recieved;

    function recive_money()public payable
    {
        assert (msg.value==uint8(msg.value));
        balance_recieved[msg.sender]+=uint8(msg.value);
    }

    function withdraw_money(address payable to,uint8 amount)public
    {
        // if this is true then the following code will execute , else the print stat will execute then the remaining will not execute
        require(amount<=balance_recieved[msg.sender],"Not enough fund in the wallet!!!");
        balance_recieved[msg.sender]-=amount;
        to.transfer(amount);
    }

}