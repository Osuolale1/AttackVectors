// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/TxOrigin.sol";


contract TxOriginTest is Test {
    TxOriginVictim victim;
    TxOriginExploit exploit;

    function setUp() public {
        victim = new TxOriginVictim();
        exploit = new TxOriginExploit(address(victim));
        victim.deposit{value: 1 ether}(); // Deposit some ether into the victim contract
    }

    function testTxOriginExploit() public {
        uint initialBalance = address(this).balance;
        // This test assumes the address(this) can act as the owner for simplicity
        exploit.exploit(address(this));

        assertTrue(address(this).balance > initialBalance, "Exploit did not transfer funds");
    }
}