// SPDX-License-Identifier: MIT

pragma solidity >=0.8.15;

contract my_contract
{
    uint public my_uint=124;

    function set_my_int(uint new_uint)public
    {
        my_uint=new_uint;
    }
}