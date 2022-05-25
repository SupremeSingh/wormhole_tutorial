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
- The core contract then makes a DELEGATE CALL (maintaining it's context) to another contract (Gaurdian ?)

After the guardians have signed the Wormhole message it’s considered a VAA or Verifiable Action Approval.
This VAA sits in a mailbox with the Guardians that is accessible via the Guardian RPC endpoints.

These VAAs can be picked up by anyone, including the original user and submitted to the target chain. 
In some cases, we have automatic relayers that pick up and submit transactions for a fee charged to 
the user that initiated the message.

When receving messages, the developer can either manually retrieve them from the Guardians or have them 
be submitted to their contracts via a Relayer. Whichever way it gets to their contract, the next steps are to 
verify the VAA to make sure it’s a signed by the Guardians, and to make sure it’s not already been processed.
