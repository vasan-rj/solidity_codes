//SPDX-License-Identifier: MIT

pragma solidity >=0.8.15;

contract my_wallet
{
    uint public my_balence;

    function deposit()public payable
    {
        my_balence += msg.value;
    }

    

    function get_balance()public view returns(uint)
    {
        
        return address(this).balance;
    }

    function withdraw_all()public
    {
        address payable to = payable(msg.sender);
        to.transfer(get_balance());

    }

    function send_to_address(address payable to_address)public 
    {
        to_address.transfer(get_balance());
    }

}