# TestProjectNFT_AirSchool

This project creates a smart contract and then deploys it to Mumbai testnet.
NFT's can then be minted by sending transaction to the deployed smart contract.

Find the NFT's on Opensea testnet:

https://testnets.opensea.io/assets/mumbai/0xf5e24a2ca20e0721198e82c49593dba380b1ac9a/1

![image](https://user-images.githubusercontent.com/94480152/152651177-07fc8093-939b-406d-95fd-c2af0a9870a2.png)


### Description:
1. Create Contract on Remix IDE
    This Contract has 2 variable (_tokenIds, _tokenURIs).
    _tokenIds : count of minted token.
    _tokenURIs : map data (tokenID -> MetaData URL) 
    
    Functions: 
    1. function _setTokenURI(uint256 tokenId, string memory _tokenURI)
        This is internal function for set the URI of tokenid.
        MintItem use this function.
    2. function tokenURI(uint256 tokenId)
        It returns the Metadata URI for token ID, providen by parameter.
        If tokenURI of ID is empty value, returns the default value. This URL contains that image url (https://miro.medium.com/max/1120/1*k_EY7dcLYB5Z5k8zhMcv6g.png)
        Else it returns the tokenURI.
    3. function MintItem(string memory tokenUri) public returns (uint256)
        MintItem is core function of this smart contract.
        increase the tokenID, and set the URI of tokenID, we use tokenUri parameter when call the _setTokenURI function.
        It is simple!
    4. function totalSupply() public view returns (uint256)
        This is very simple function that return count of total token.
        We can't not use _tokenIds value directly, because it's private value.
2. Create Default Metadata on Pinata
    https://gateway.pinata.cloud/ipfs/QmfASTT8yYCXqw9ikgAUGfcM6rrD8CvSCQG7ssfz9mjth8/default.json
    
    ![image](https://user-images.githubusercontent.com/94480152/152651201-2cea5f63-2253-4130-aa89-03ad9da5fd56.png)

3. Experiment on Mumbai Testnet
    Deploy the smart contract on Mumbai Testnet.
    And Run MintItem Function. (I didn't set the parameter)
    It will set default value, metadata contains the image url you provide to me.
    ![image](https://user-images.githubusercontent.com/94480152/152651286-1e69e08b-15b9-460b-9b18-5b989977018a.png)


   Thanks for reading!!🥳🥳




