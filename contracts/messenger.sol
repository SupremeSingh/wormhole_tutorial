// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Part 1 - Sending a msg from src chain to the Wormhole Network 

Prereq - Understanding Woemhole basics, Call vs Delegate Call 

Here, we have a function, sendStr() that takes in a bytes array and a nonce (random number) that 
will call the Wormhole SDK and submit the message. In the publishMessage() function, the arguments are ...

- Nonce: A random number. Needed so same msg is not validated twice
- Bytes: An array of bytes that can hold any data
- Finality: How many blocks to wait on the source chain to consider it safe that the message won’t roll back. 

This works by - 

- First, we convert our string to a bytes array to save memory (and hence gas costs) on the EVM
- The contract we have deployed then makes a function CALL to the core bridge contract on Ropsten 
- The core contract takes the message and packages it into a VAA after 1 block has elapsed 
- The core contract then makes a DELEGATE CALL (maintaining it's context) to another contract
*/

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