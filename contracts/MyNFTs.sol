pragma solidity 0.5.6;

import "@klaytn/contracts/token/KIP17/KIP17Full.sol";
import "@klaytn/contracts/drafts/Counters.sol";
import "@klaytn/contracts/ownership/Ownable.sol";

contract MyNFTs is KIP17Full, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public KIP17Full("MyNFTs", "MNFT") {}

    function mintNFT(string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}