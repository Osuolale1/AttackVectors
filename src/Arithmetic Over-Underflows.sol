// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Exploit: Arithmetic Over/Underflows

// Description: Happens when arithmetic operations exceed or fall below the storage limit, causing wrap-around behavior.

// Real-World Example: The PoWHC contract suffered from an overflow vulnerability, allowing attackers to mint tokens arbitrarily.

// Vulnerable Contract Code:

contract VulnerableToken {
    mapping(address => uint256) public balances;

    function mint(address _to, uint256 _amount) public {
        balances[_to] += _amount;
    }
}

contract SafeToken {
    mapping(address => uint256) public balances;

    function mint(address _to, uint256 _amount) public {
        require(balances[_to] + _amount >= balances[_to], "Overflow detected");
        balances[_to] += _amount; // Safe with overflow checks in Solidity 0.8.x
    }
}
