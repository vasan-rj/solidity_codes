// SPDX-License-Identifier: MIT
pragma solidity>=0.8.14;

contract my_contract
{
    address public my_address;

    function set_address(address input_address)public
    {
        my_address=input_address;
    }

    function check_balance()public view returns(uint)
    {
        return my_address.balance;
    }

}