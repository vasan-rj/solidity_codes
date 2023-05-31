// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14;

contract my_mapping
{
    mapping(address=>uint)public ex_mapping;

    mapping(uint=>mapping(uint=>bool)) public index_mapping;

    function set_mapping(uint my_val)public
    {
        ex_mapping[msg.sender]=my_val;
    }


    function set_index_mapping(uint a, uint b,bool valx)public
    {
        index_mapping[a][b]=valx;
  
    }


    function getbalance(address my_address)public view returns(uint)
    {
        return ex_mapping[my_address];
    }


}