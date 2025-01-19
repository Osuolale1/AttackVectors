// Unupgradable smart contracts
// Smart contracts are by definition immutable (they can be “self-destructed” by not modified) and unstoppable, meaning that if for some reason you deploy a buggy smart contract, you will not be able to fix it and redeploy a new version…


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DepositOnly {
    // Event to log deposits
    event Deposit(address indexed sender, uint256 amount);

    // Fallback function to receive Ether
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    // Function to allow explicit deposits
    function deposit() external payable {
        require(msg.value > 0, "Deposit must be greater than 0");
        emit Deposit(msg.sender, msg.value);
    }

    // Function to retrieve the contract balance (for viewing only)
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // No withdrawal function provided
}


// Solution: Always use upgradable patterns for your smart contracts (transparent proxies, admin proxies, beacon proxies, etc…). You do not need to implement them, you can reuse the functionality offered by openzeppelin for example. You can also consider the possibility of adding the “Pausable” pattern to some of your contract’s functions. “Pausable” function can be paused (meaning nobody can invoke them), this will give you more time to fix a bug and deploy a new version.

