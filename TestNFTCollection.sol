// SPDX-License-Identifier: MIT
pragma solidity >=0.8.1 < 0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestNFTCollection is Ownable, ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    using Strings for uint256;
    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("TestNFTCollection", "TNC") {}

    /*
    set the URI of each token
    */
    function _setTokenURI(uint256 tokenId, string memory _tokenURI)
        internal
        virtual
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI set of nonexistent token"
        );
        _tokenURIs[tokenId] = _tokenURI;
    }

    /**
     ** Get tokenURI by tokenid
     ** If toekURI not set, it returns the default value.
     */
    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );

        string memory _tokenURI = _tokenURIs[tokenId];

        // If there is no base URI, return the token URI.
        if (bytes(_tokenURI).length == 0) {
            return "https://gateway.pinata.cloud/ipfs/QmfASTT8yYCXqw9ikgAUGfcM6rrD8CvSCQG7ssfz9mjth8/default.json";
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        return _tokenURI;
    }

    /*
    ** mint NFT by using tokenUri
    */
    function MintItem(string memory tokenUri) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenUri);
        return newItemId;
    }

    /*
    return value of total supply
    */
    function totalSupply() public view returns (uint256) {
        return _tokenIds.current();
    }
}