//SPDX-License-Identifier: MIT

pragma solidity >=0.8.15;

contract SampleFallback 
{
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public my_uint;
    

    function setuint(uint my_new_uint)public
    {
        my_uint=my_new_uint;
    }
    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable 
    {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}
