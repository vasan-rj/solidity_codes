// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15;

contract contract_one
{
    mapping(address=>uint)public address_balance;

    function deposit_c1()public payable
    {
        address_balance[msg.sender]+=msg.value;
    }
}

contract contract_two
{
    receive() external payable{}

    function deposit_to_contract_one(address contract_one_addr)public
    {
        contract_one one=contract_one(contract_one_addr);
        one.deposit_c1{value:10,gas:10000}();
    }
}