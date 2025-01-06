//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Destructor {
    function destruct() external{
        selfdestruct(payable(msg.sender));
    }
}
