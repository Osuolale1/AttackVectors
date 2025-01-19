// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Short Address Attack
contract ShortAddressVictim {
    function transfer(address to, uint amount) public {
        // Here, if 'to' is padded incorrectly, additional data might be interpreted as part of 'amount'
    }
}

contract ShortAddressExploit {
    ShortAddressVictim victim;
    constructor(address _victim) {
        victim = ShortAddressVictim(_victim);
    }
    function exploit(address shortAddr) public {
        // If this contract was to send a transaction with padded data, it could manipulate 'amount'
        victim.transfer(shortAddr, 1);  // This would be manipulated by padding
    }
}
