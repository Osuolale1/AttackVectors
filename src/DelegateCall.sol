// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Delegatecall
contract DelegatecallStorage {
    uint public num;
    function setNum(uint _num) public {
        num = _num;
    }
}

contract DelegatecallExploit {
    address public storageAddr;
    constructor(address _storageAddr) {
        storageAddr = _storageAddr;
    }
    function setNum(uint _num) public {
        (bool success, ) = storageAddr.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
        require(success, "delegatecall failed");
    }
    function pwn() public {
        setNum(1337); // Overwrites storage in the calling contract
    }
}
