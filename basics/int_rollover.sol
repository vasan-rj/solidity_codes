// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14;

contract uint_contract
{
    uint256 public uint_var;  //0- 2^256 -1

    uint16 public uint64_var=301;

    uint public int_var=0; // 2^128 to 2^128 -1


    function set_uint(uint uint_var_f)public
    {
        uint_var=uint_var_f;
    }

    function inc_dec()public
    {
        uint64_var++;
        int_var--;
    }

}