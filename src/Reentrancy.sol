// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Exploit: Re-Entrancy
// DAO contract - vulnerable to reentrancy attackcy Attack

// Description: Occurs when an external contract calls back into the vulnerable contract before the initial function execution is complete or the state get updated, leading to unexpected behavior or fund theft.

// Real-World Example: The DAO hack in 2016 exploited a re-entrancy vulnerability, resulting in the loss of approximately 3.6 million Ether.

// Vulnerable Contract Code:

contract DAO {
    mapping(address => uint256) public balances;

    function createProposal(address _recipient, uint256 _amount) public {
        // Proposal logic
    }

    function contribute() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] >= _amount) {
            msg.sender.call.value(_amount)(); // Reentrancy vulnerability
            balances[msg.sender] -= _amount;
        }
    }
}

pragma solidity ^0.4.11;

contract DAO {
    mapping(address => uint256) public balances;

    function createProposal(address _recipient, uint256 _amount) public {
        // Proposal logic
    }

    function contribute() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        uint256 balance = balances[msg.sender];
        require(balance >= _amount, "Insufficient balance");
        balances[msg.sender] = balance - _amount; // First, update the state
        msg.sender.call.value(_amount)(); // Then send Ether
    }
}
