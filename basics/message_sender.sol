// SPDX-License-Identifier: MIT
pragma solidity>=0.8.14;

contract my_contract
{
    address public my_address;

    function get_address()public
    {
        my_address=msg.sender;

    }

    
}