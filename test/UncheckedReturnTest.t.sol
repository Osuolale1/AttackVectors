// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/UncheckedReturn.sol";

contract UncheckedReturnTest is Test {
    UncheckedReturnVictim victim;
    UncheckedReturnExploit exploit;

    function setUp() public {
        victim = new UncheckedReturnVictim();
        exploit = new UncheckedReturnExploit(address(victim));
        payable(victim).transfer(1 ether); // Fund the victim contract
    }

    function testUncheckedReturnExploit() public {
        address payable receiver = payable(address(1)); // Some address to receive funds
        uint initialBalance = receiver.balance;
        exploit.exploit(receiver);

        assertTrue(receiver.balance > initialBalance, "Funds were not transferred");
    }
}