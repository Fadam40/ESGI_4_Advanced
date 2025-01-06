// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TargetContract {
    uint256 public storedValue;

    // Fonction pour mettre à jour la valeur
    function setValue(uint256 _value) external {
        storedValue = _value;
    }

    // Fonction pour lire la valeur
    function getValue() external view returns (uint256) {
        return storedValue;
    }
}
