/*
PROJECT DESCRIPTION
    =>providing single owner
    =>recieving funds
    =>spend money on EOA(externally owned accounts) and contracts
    =>give other people allowence
    =>setting guardian of 5 people and setting new owner with the help of these guardians
     */

// SPDX-License-Identifier: MIT
pragma solidity =0.8.16;

contract end_user
{
    function show_balance()public view returns(uint)
    {
        return address(this).balance;
    }

    function deposit()public payable
    {

    }
}
contract smart_wallet
{
    address payable public  owner;
    // allowence - for sending wei to this 
    mapping(address=>uint)public allowence;
    mapping(address=>bool)public is_allowed_to_send;
    mapping(address=>bool)public guardians;

    address payable next_owner;
    mapping(address=>mapping(address=>bool))next_guardian_voted_bool;

    uint guardians_reset_count;
    uint public constant confirmation_from_guardians_for_reset=3;

    constructor()
    {
        owner=payable(msg.sender);
    }

    function set_guardian(address _guardian, bool _isguardian)public
    {
        require(msg.sender==owner,"you are the owner!!,aborting");
        guardians[_guardian]=_isguardian;
    }

    function propose_new_owner(address payable _new_owner)public
    {
        require(guardians[msg.sender],"you are not the guardian of this wallet");
        require(next_guardian_voted_bool[_new_owner][msg.sender]==false,"you already voted!!, aborting");
        if(_new_owner!=next_owner)
        {
            next_owner=_new_owner;
            guardians_reset_count=0;
        }
        guardians_reset_count+=1;

        if(guardians_reset_count>=confirmation_from_guardians_for_reset)
        {
            owner=next_owner;
            next_owner=payable(address(0));
        }
    }

// **********************

    function set_allowence(address _for,uint _amount)public 
    {
        require(msg.sender==owner,"you are not the owner!!,aborting");
        allowence[msg.sender]=_amount;

        if(_amount>0)
        {
            is_allowed_to_send[_for]=true;
        }

        else
        {
            is_allowed_to_send[_for]=false;
        }
    }

    function transfer_amount(address payable _to, uint _amount,bytes memory _payload)public returns(bytes memory)
    {
        // require(msg.sender==owner,"you are not the owner!!");
        // _to.transfer(_amount);

        if(msg.sender!=owner)
        {
            require(is_allowed_to_send[msg.sender],"you are not allowed to send anything from this smart contract!,aborting!");
            require(allowence[msg.sender]>=_amount,"Cannot able to send more amount than the wallet balence!!");   
        }


        (bool success,bytes memory return_data)=_to.call{value:_amount}(_payload);
        require(success,"Aborting, Call was not sucessful!!");
        return return_data;

    }

    receive() external payable
    {


    }
}