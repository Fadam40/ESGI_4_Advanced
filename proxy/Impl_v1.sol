// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImplementationV1 {
    uint256 public value; // Première variable de stockage
    address public admin; // Deuxième variable de stockage

    function initialize(uint256 _value) public {
        value = _value;
        admin=msg.sender;
    }
}
