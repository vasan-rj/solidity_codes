// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14;

contract bool_contract
{
    // default value of boolean is false;
    bool public bool_var;

    function set_bool(bool my_bool)public
    {
        bool_var=my_bool;
    }

}