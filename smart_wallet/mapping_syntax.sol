// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14;


// MAPPING SYNTAX 
// mapping(keyType => valueType) public myMapping;


contract SampleContract 
{
    mapping(address => uint) public balances;

    function setBalance(uint _balance) public 
    {
        balances[msg.sender] = _balance;
    }

    function getBalance(address _address) public view returns (uint) 
    {
        return balances[_address];
    }
}
