// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15;

contract try_catch
{
    error not_allowed_error(string);
    function dummy_func()public pure
    {
        // require(false,"Error Message!!");
        // assert(false);
        revert not_allowed_error("not allowed!!!");
    }
}

// ************* ///

contract Error_handling
{
    event error_logging(string reason);
    event error_code(uint code);
    event error_log_bytes(bytes low_level_data);

    function catch_error()public payable
    {
        try_catch x=new try_catch();

        try x.dummy_func()
        {
            // add code here!!
        }

        catch Error(string memory reason)
        {
            // ...
            emit error_logging(reason);
        }

        catch Panic(uint errcode)
        {
            emit error_code(errcode);
        }

        catch(bytes memory low_level_data)
        {
            emit error_log_bytes(low_level_data);
        }
    }
}

