// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/Reentrancy.sol";

contract ReentrancyTest is Test {
    ReentrancyVictim victim;
    ReentrancyExploit exploit;

    function setUp() public {
        victim = new ReentrancyVictim();
        exploit = new ReentrancyExploit(address(victim));
    }

    function testReentrancyExploit() public {
        payable(address(victim)).transfer(5 ether);
        victim.deposit{value: 3 ether}();
        
        uint balanceBefore = address(exploit).balance;
        exploit.attack();
        
        uint balanceAfter = address(exploit).balance;
        assertTrue(balanceAfter > balanceBefore, "Reentrancy exploit did not increase attacker's balance");
    }
}

