// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20 {
    
    uint256 public _initialSupply = 100 * 10 ** 18;

    constructor() ERC20("MyToken", "MTN") {
        _mint(msg.sender, _initialSupply);
    }

}