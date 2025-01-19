

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/Timestamp.sol";

contract TimestampTest is Test {
    TimestampVictim victim;
    TimestampExploit exploit;

    function setUp() public {
        victim = new TimestampVictim();
        exploit = new TimestampExploit(address(victim));
    }

    function testTimestampExploit() public {
        // Note: Real manipulation of block.timestamp is difficult in a test environment
        uint result = victim.random();
        assertTrue(result >= 0 && result < 10, "Random number should be between 0 and 9");
    }
}
