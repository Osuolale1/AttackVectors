// SPDX-License-Identifier: MIT
pragma solidity ^0.5.1;

// Improper Array Deletion
// Description:
// In Solidity, we remove an element from an array using the “delete” function. However, the length and sequence of the array may not remain as expected. If we delete the array index x, we will see that the array length remains the same, just that the value at index x has been set to zero.

// Remediation:
// Instead of “delete” and “.length=0”, use push and pop functions to interact with array elements.

contract EtherRemoval {
    uint256[] public firstArray = [1, 2, 3, 4, 5];

    function removeItem(uint256 i) public {
        delete firstArray[i];
    }

    function getLength() public view returns (uint256) {
        return firstArray.length;
    }

// function remove(uint256 _index) public {
//     require(_index < arr.length, "index out of bound");

//     for (uint256 i = _index; i < arr.length - 1; i++) {
//         arr[i] = arr[i + 1];
//     }
//     arr.pop();
// }

// function remove(uint256 index) public {
//     // Move the last element into the place to delete
//     arr[index] = arr[arr.length - 1];
//     // Remove the last element
//     arr.pop();
// }
}