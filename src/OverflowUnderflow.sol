// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Integer Overflow/Underflow
contract OverflowUnderflowVictim {
    uint public counter = 0;
    function increment() public {
        counter += 1;
    }
    function decrement() public {
        counter -= 1;
    }
}

contract OverflowUnderflowExploit {
    OverflowUnderflowVictim victim;
    constructor(address _victim) {
        victim = OverflowUnderflowVictim(_victim);
    }
    function overflow() public {
        for (uint i = 0; i < 10; i++) {
            victim.increment();
        }
        // counter will overflow at some point
    }
    function underflow() public {
        for (uint i = 0; i < 10; i++) {
            victim.decrement();
        }
        // counter will underflow at some point
    }
}