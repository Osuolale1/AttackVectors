// SPDX-License-Identifier: MI
pragma solidity 0.7.0;

// Exploit: "Unprotected Self-Destruct",
// Description: "A contract allows for a `selfdestruct` function that can be triggered by any user, potentially taking down the contract.",
//  Real-World Example: "The Parity Multisig Wallet issue allowed an attacker to trigger a `selfdestruct` on a contract and effectively remove funds from circulation.",
//  Vulnerable Contract Code:

pragma solidity ^0.8.0;

contract VulnerableSelfDestruct {
    function kill() public {
        selfdestruct(payable(msg.sender)); // Anyone can destroy the contract
    }
}

//solution
contract SecureSelfDestruct {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute");
        _;
    }

    function kill() public onlyOwner {
        selfdestruct(payable(owner));
    }
}
