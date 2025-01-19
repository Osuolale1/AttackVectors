// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Unchecked Return Values
contract UncheckedReturnVictim {
    function transfer(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }
}

contract UncheckedReturnExploit {
    UncheckedReturnVictim victim;
    constructor(address _victim) {
        victim = UncheckedReturnVictim(_victim);
    }
    function exploit(address payable _addr) public {
        victim.transfer(_addr, 1 ether); // No check if transfer actually succeeded
    }
}
