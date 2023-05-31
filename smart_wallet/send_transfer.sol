// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15;

contract sender
{
    receive() external payable {}

    function withdraw_transfer(address payable to)public
    {
        to.transfer(1000000000000);
        // transfers 10 wei to the (to)wallet address
    }

    function withdraw_send(address payable to)public
    {
        bool is_sent=to.send(10);
        // to.send(10000000000000);
        // send only return boolean, doesn't 
        require(is_sent,"sending the funds was sucessfull!!!");
    }
}

contract reciever_no_action
{
    function balance()public view returns(uint)
    {
        return address(this).balance;
    }

    receive() external payable
    {}
}

contract reciever_action
{
    uint public balance_recieved;

    receive() external payable
    {
        balance_recieved+=msg.value;
    }

     function balance()public view returns(uint)
    {
        return address(this).balance;
    }
}
// notes :

// (transfer) and (send) have same functionality but we should use them under a condition
// 
