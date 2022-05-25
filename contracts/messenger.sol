// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Helpers/IWormhole.sol";
import "./Helpers/Structs.sol";

contract Messenger {
    // Hardcode the Wormhole Core Bridge contract address for Ropsten
    address a = address(0x210c5F5e2AF958B4defFe715Dc621b7a3BA888c5);
    IWormhole _wormhole = IWormhole(a);

    function string_tobytes(string memory s) public pure returns (bytes memory b3) {
        b3 = bytes(s);
        return b3;
    }

    function sendStr(bytes memory str, uint32 nonce) public returns (uint64 sequence) {
        sequence = _wormhole.publishMessage(nonce, str, 1);
        return sequence;
    }
    function wormhole() public view returns (IWormhole) {
        return _wormhole;
    }
}