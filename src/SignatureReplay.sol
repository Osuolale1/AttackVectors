// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Signature Replay Attacks
contract SignatureReplayVictim {
    function verifySig(uint _amount, uint8 _v, bytes32 _r, bytes32 _s) public pure returns (address) {
        bytes32 message = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(abi.encodePacked(_amount))));
        return ecrecover(message, _v, _r, _s);
    }
}

contract SignatureReplayExploit {
    function replay(uint _amount, uint8 _v, bytes32 _r, bytes32 _s) public {
        SignatureReplayVictim victim = new SignatureReplayVictim();
        address from = victim.verifySig(_amount, _v, _r, _s);
        // Use 'from' to perform actions or transfer funds again
    }
}
