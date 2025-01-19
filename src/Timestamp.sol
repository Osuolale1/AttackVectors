// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Timestamp Dependence
contract TimestampVictim {
    function random() public view returns (uint) {
        return uint(block.timestamp) % 10;
    }
}

contract TimestampExploit {
    TimestampVictim victim;
    constructor(address _victim) {
        victim = TimestampVictim(_victim);
    }
    function exploit() public {
        // This would benefit from a miner choosing a favorable block timestamp
        uint result = victim.random();
        if (result == 7) {
            // Do something favorable
        }
    }
}
