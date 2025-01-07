// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Proxy {
    // EIP-1967 storage slot pour l'adresse de l'implémentation
    bytes32 private constant IMPLEMENTATION_SLOT = keccak256("eip1967.proxy.implementation") ;

    constructor(address _implementation) {
        _setImplementation(_implementation);
    }

    fallback() external payable {
        _delegate(_implementation());
    }

    receive() external payable {
        _delegate(_implementation());
    }

    function _implementation() internal view returns (address impl) {
        // Utiliser une variable locale pour accéder à la constante
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            impl := sload(slot)
        }
    }

    function _setImplementation(address _impl) internal {
        // Utiliser une variable locale pour accéder à la constante
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            sstore(slot, _impl)
        }
    }

    function upgrade(address _newImplementation) external {
        _setImplementation(_newImplementation);
    }

    function _delegate(address _impl) internal {
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), _impl, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }
}
