// SPDX-License-Identifier: Apache 2
pragma solidity ^0.8.0;

/*
Part 1 - Sending a msg from src chain to the Wormhole Network 

Here, we have a function, sendStr() that takes in a bytes array and a nonce (random number) that 
will call the Wormhole SDK and submit the message. In the publishMessage() function, the arguments are ...

- Nonce: A random number. Needed so same msg is not validated twice
- Bytes: An array of bytes that can hold any data
- Finality: How many blocks to wait on the source chain to consider it safe that the message won’t roll back. 
*/

import "./Helpers/IWormhole.sol";
import "./Helpers/Structs.sol";

contract Messenger {
    // Hardcode the Wormhole Core Bridge contract address 
    // Using Ropsten's core contract 
    address a = address(0x210c5F5e2AF958B4defFe715Dc621b7a3BA888c5);
    IWormhole _wormhole = IWormhole(a);

    function sendStr(bytes memory str, uint32 nonce) public returns (uint64 sequence) {
        sequence = _wormhole.publishMessage(nonce, str, 1);
        return sequence;
    }

    function wormhole() public view returns (IWormhole) {
        return _wormhole;
    }
}