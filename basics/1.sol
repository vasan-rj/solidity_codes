// SPDX-License-Identifier: MIT

pragma solidity >=0.8.14;

contract mycontract
{
    string public outstring ="hello_world";

    function update(string memory upstr)public
    {
        outstring=upstr;
    }


}