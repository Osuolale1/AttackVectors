// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import "../src/DelegateCall.sol";

contract DelegatecallTest is Test {
    DelegatecallStorage storageContract;
    DelegatecallExploit exploit;

    function setUp() public {
        storageContract = new DelegatecallStorage();
        exploit = new DelegatecallExploit(address(storageContract));
    }

    function testDelegatecallExploit() public {
        exploit.pwn();

        assertTrue(storageContract.num() == 1337, "Storage was not altered via delegatecall");
    }
}
