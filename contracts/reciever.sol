/*
After the guardians have signed the Wormhole message it’s considered a VAA or Verifiable Action Approval.
This VAA sits in a mailbox with the Guardians that is accessible via the Guardian RPC endpoints.

These VAAs can be picked up by anyone, including the original user and submitted to the target chain. 
In some cases, we have automatic relayers that pick up and submit transactions for a fee charged to 
the user that initiated the message.

When receving messages, the developer can either manually retrieve them from the Guardians or have them 
be submitted to their contracts via a Relayer. Whichever way it gets to their contract, the next steps are to 
verify the VAA to make sure it’s a signed by the Guardians, and to make sure it’s not already been processed.
*/