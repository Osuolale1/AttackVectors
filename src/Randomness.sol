// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Randomness {
    address public lastWinner;
    uint256 public lastRandomNumber;

    // Users can call this function to try their luck
    function tryLuck() external {
        // Insecure randomness using block attributes
        uint256 randomNumber = uint256(
            keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))
        );

        lastRandomNumber = randomNumber;

        // User wins if the random number is even
        if (randomNumber % 2 == 0) {
            lastWinner = msg.sender;
        }
    }
}
