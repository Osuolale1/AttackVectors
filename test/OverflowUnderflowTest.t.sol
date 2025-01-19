// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/OverflowUnderflow.sol";


contract OverflowUnderflowTest is Test {
    OverflowUnderflowVictim victim;
    OverflowUnderflowExploit exploit;

    function setUp() public {
        victim = new OverflowUnderflowVictim();
        exploit = new OverflowUnderflowExploit(address(victim));
    }

    function testOverflowExploit() public {
        uint initial = victim.counter();
        exploit.overflow();
        assertTrue(victim.counter() < initial, "Counter did not overflow");
    }

    function testUnderflowExploit() public {
        uint initial = victim.counter();
        exploit.underflow();
        assertTrue(victim.counter() > initial, "Counter did not underflow");
    }
}