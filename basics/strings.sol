// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14;

contract string_contract
{
    string public str_var="meta_miners";

    function str_func(string memory my_str)public
    {
        str_var=my_str;
    }

    function cmp_str(string memory my1_str)public view returns(bool)
    {
        return keccak256(abi.encodePacked(str_var))==keccak256(abi.encodePacked(my1_str));
        
        // kecack256 (cryptographic hash function takes string as arguement) and gives a 256 bit hash length
        // abi.encodePacked (encodes the hash value)
    }

}