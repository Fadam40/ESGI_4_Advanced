// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CallerContract {
    // Met à jour la valeur dans TargetContract via `call`
    function updateValueViaCall(address target, uint256 newValue) external returns (bool success, bytes memory data) {
        // Préparer les données pour l'appel
        (success, data) = target.call(
            abi.encodeWithSignature("setValue(uint256)", newValue)
        );

        // Retourner les résultats
        return (success, data);
    }

    // Lit la valeur dans TargetContract via `staticcall`
    function readValueViaStaticCall(address target) external view returns (uint256 value) {
        // Préparer les données pour l'appel
        (bool success, bytes memory data) = target.staticcall(
            abi.encodeWithSignature("getValue()")
        );

        require(success, "Static call failed");

        // Décoder les données retournées
        value = abi.decode(data, (uint256));
    }

}
