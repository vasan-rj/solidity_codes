// SPDX-License-Identifier: MIT

pragma solidity >=0.8.15;

contract fall_back_contract
{
    uint public last_value_sent;
    string public last_function_called;

    // recieve function (function which can recieve ether)
    
    receive() external payable
    {
        last_value_sent=msg.value;
        last_function_called="Recieved";
    }



}
