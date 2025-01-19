// SPDX-License-Identifier: MIT
pragma solidity ^0.4.11;

// Uniswap Front-Running Attack (2020)
// Real-World Example: An attacker exploited the front-running issue in Uniswap's price oracle. By observing a transaction before it was confirmed, they could submit their own transaction with a higher gas fee and manipulate prices.

// Vulnerable Contract Code:

contract UniswapVulnerable {
    uint256 public price;

    function updatePrice(uint256 _newPrice) public {
        price = _newPrice; // No protection against front-running
    }

    function swap(uint256 _amount) public {
        require(_amount >= price, "Insufficient amount");
        // Swap logic
    }
}

// Explanation: The lack of protection against transaction ordering made the contract vulnerable to front-running, where attackers could alter the price before the legitimate transaction was confirmed.

contract UniswapSecure {
    uint256 public price;
    uint256 public lastPrice;

    modifier preventFrontRunning() {
        require(price != lastPrice, "Transaction already processed");
        _;
    }

    function updatePrice(uint256 _newPrice) public preventFrontRunning {
        lastPrice = price;
        price = _newPrice;
    }

    function swap(uint256 _amount) public {
        require(_amount >= price, "Insufficient amount");
    }
}
