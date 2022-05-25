// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface TokenBridge {
  function attestToken(address tokenAddress, uint32 nonce) external payable returns (uint64 sequence);
  function transferTokens(address token, uint256 amount, uint16 recipientChain, bytes32 recipient, uint256 arbiterFee, uint32 nonce) external payable returns (uint64);
}

contract mockTokenToWhatever {

    string public purpose = "Token Transfer";
    IERC20 token;

    constructor(address tokenAddress) {
      token = IERC20(tokenAddress);
    }

    function convertAddressToBytes(address sourceAddress) public pure returns (bytes32 result) {
        result = bytes32(uint256(uint160(sourceAddress)));
    }

    function attestAndApproveToken(uint256 amount, address _address, address tokenAddress, uint32 nonce) public returns (uint64 sequence) {
        token.approve(address(this), amount);
        sequence = TokenBridge(_address).attestToken(tokenAddress, nonce);
    }

    function transferTokens(uint256 amount, address _address, uint16 targetChain, bytes32 targetAddress, uint256 fee, uint32 nonce) public returns (uint256, uint256) {
      require(token.transferFrom(msg.sender, address(this), amount));
      
      TokenBridge(_address).transferTokens(address(token), amount, targetChain,  targetAddress, fee, nonce);

      return (0,0);
    }

}