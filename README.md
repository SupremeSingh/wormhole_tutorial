**Cross Blockchain Communication Platforms**

Based on [this](https://docs.google.com/document/d/1EhJir4iHHIjm9jHJS1lMzFFNsIsR4Gdq0KsNGihMIAw/edit?usp=sharing) cross-chain paper, we safely concluded that NO chain is perfect for all purposes. This is encapsulated in the &quot;triangle of impossibilities&quot; - you can&#39;t have scalability, security and decentralization. Does that mean we must always play pick and choose and never be really happy with what we build. Perhaps not.

What if dApps could have a &quot;patchwork&quot; of functionalities from different chains. The speed of a PoS, the decentralization of a PoW and so on. Let&#39;s call such dApps XdApps (or cross chain dApps). Of course, the assets used on these apps would be cross chain too (say XAssets) … and their data XData.

For all of this to happen - we need to build a &quot;communication layer&quot; for blockchains to transmit information. This information could take many forms - a token, an NFT or maybe just a proof that something has been done. In fact, the &quot;layer&quot; should be able to support ALL kinds of messages to be abstract enough to provide the requisite flexibility.

Imagine DEXes that run on multiple chains w/ one, un-fragmented liquidity pool, NFT mkt places that let you buy assets on any chain from a single wallet, lending apps where you put up collateral on one chain &amp; borrow on another.

Do such solutions exist - yes ! And spoiler alert - they suck. They tend to be slow, expensive and every now and then get hacked for a small fortune. But people still use them. And when people need a problem solved so badly they can&#39;t help but use a bad product - that&#39;s an important problem.

![](RackMultipart20220525-1-bqsoj5_html_b9800706d8b07f7.png)

Do note - a communication protocol is NOT a bridge. Think of bridges (software that allows you to transfer an asset from one chain to another) as an application to be built ON TOP of communication protocols. After all, a token is only one type of &quot;message&quot; - there can be many others.

Some products that perhaps fit this bill are Axelar, LayerZero, the IBCP and Wormhole.

**Wormhole**

&quot;_Wormhole is a generic message passing protocol that connects to multiple chains including Ethereum, Solana, Terra, Binance Smart Chain, Polygon, Avalanche, Oasis, and Fantom.&quot;_

When you hit that &quot;send&quot; button on your email - your computer doesn&#39;t just drop your mail into the recipient&#39;s computer. It sends a &quot;packet&quot; of 0s and 1s to the router in your building. That then sends it to another router, and another till the packet reaches a mailing server (fancy word for computer). Now the recipient can pull their mail out of this server using their end of the internet (this is generally done automatically by Outlook or Gmail).

Wormhole is the same. The platform deploys smart contracts called &quot;core contracts&quot; on every blockchain it aims to connect. Any other contracts that exist within a chain now have a point of contact to reach the wormhole cloud (kinda like a router). These contracts receive messages, pack them into units and send them to the Wormhole network for validation.

The validation is done by a consortium of &quot;whales&quot; called guardians who have business interests in keeping Wormhole safe. A transaction is ONLY considered valid when at least 66% of these guardians sign off. Once the guardian network &quot;validates&quot; them - pieces of code called &quot;relays&quot; carry the messages to their intended recipients.

Do these whales make any money validating transactions. Of course, every time you send a message on wormhole you have to specify a reward - the higher the reward the more lucrative it is to the group. You can think of it as a gas fee. Also, you still need to pay the gas fee to send messages to wormhole on whatever chain you are using.

This simple message passing primitive enables cross chain functionality. Users interact with xDapps (cross chain decentralized applications) to transfer xAssets (cross chain assets) between networks or access their xData (cross chain data) to provide them services on their current network.

On top of the Wormhole message protocol, there&#39;s two specific applications that help concentrate liquidity for xAssets. The Portal Token Bridge and Portal NFT Bridge provide a standard message format for token and NFT transfers across the Wormhole bridge.

Wormhole has a few salient features

- Fully Generic: Wormhole essentially doesn&#39;t care WHAT you send which gives you a good deal of flexibility to build on top of it.
- Consensus Abstraction: Since the validation is done by almost a &quot;private&quot; group of parties, and all the parties are quite reputed and incentivised to support the network - consensus can be reached very quickly.
- Upgradeability: Wormhole&#39;s contracts are modular and upgradeable … they can be applied to different chains conveniently and still serve the same purpose.
- Speed: Fast consensus, tiny fees (most of the times) and lots of liquidity courtesy these guardians are mostly institutional LPs mean transactions go through fast on Wormhole. But is it _truly_ decentralized … we don&#39;t talk about that here.

More definitions and concepts

- [Keywords](https://docs.wormholenetwork.com/wormhole/core-concepts)
- [Message Structuring 1](https://docs.wormholenetwork.com/wormhole/core-concepts/portal-payloads)
- [Message Structuring 2](https://docs.wormholenetwork.com/wormhole/core-concepts/vaa-format)
