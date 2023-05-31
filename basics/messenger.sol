// SPDX-License-Identifier: MIT
pragma solidity>=0.8.15;

contract messenger_contracr
{
    uint public counter;
    address private owner=msg.sender;
    // wallet address of the person who is deploying the smart contract.

    string public my_message;

    function update_message(string memory entered_string)public
    {
        if(msg.sender==owner)
        {
            my_message=entered_string;
            counter++;
        }
    }
}