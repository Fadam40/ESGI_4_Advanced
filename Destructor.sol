// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

  contract Destructor {
    function fallback() external{
        selfdestruct(payable(msg.sender));
    }
}
