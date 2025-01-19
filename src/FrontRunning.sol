// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Front Running
contract FrontRunningVictim {
    function buyToken() public payable {
        // Token minting or price change logic here
    }
}

contract FrontRunningExploit {
    FrontRunningVictim victim;
    constructor(address _victim) {
        victim = FrontRunningVictim(_victim);
    }
    function frontRun(uint amount) public payable {
        victim.buyToken{value: amount}();
    }
}
