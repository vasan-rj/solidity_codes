// SPDX-License-Identifier: MIT
pragma solidity>=0.8.14;

contract my_contract
{
    
    uint public store_var;

    function get_var()public view returns(uint)
    {
        return store_var;
    }

    function add_num(uint a, uint b)public pure returns(uint)
    {
        return a+b;
    }

    function storing_var(uint var_x)public  returns(uint)
    {
        store_var=var_x;
        return var_x;

    }

}