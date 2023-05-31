// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15;

contract my_mapping2
{
    mapping(address=>uint)public v_balances;

   
    function send_money()public  payable
    {
        v_balances[msg.sender]+=msg.value;
    }

    function get_balance()public view returns(uint)
    {
        // return money;
    }

    function withdraw_allmoney(address payable to)public 
    {
        uint final_balance=v_balances[msg.sender];
        v_balances[msg.sender]=0;
        to.transfer(final_balance);
    }
}