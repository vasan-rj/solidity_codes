// SPDX-License-Identifier: MIT
pragma solidity>=0.8.15;

contract constructor_contract
{
    address public my_address;

    constructor(address example_address)
    {
        my_address=example_address;

    }

    function show_address()public view returns(address)
    {
        return my_address;
    }

}