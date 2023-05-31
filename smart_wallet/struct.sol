// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15;


// struct in solidity

contract wallet1
{
    payment_recieved public payment;

    function pay_contract()public payable
    {
        payment=new payment_recieved(msg.sender,msg.value);
    }

}

// ************ 

contract payment_recieved
{
    address public from;
    uint public amount;

    constructor(address _from, uint _amount)
    {
        from=_from;
        amount=_amount;
    }
}

// ************

contract wallet2

{

    struct payment_recieved_struct
    {
        address from;
        uint amount;
    }


    payment_recieved_struct public pay_ment;


    function pay_contract()public payable
    {
        // pay_ment=payment_recieved_struct(msg.sender,msg.value);

        pay_ment.from=msg.sender;
        pay_ment.amount=msg.value;

    }

}