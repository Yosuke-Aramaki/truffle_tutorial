pragma solidity ^0.4.25;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

/**
 * @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract NFTToken is ERC721Token {
  uint256 internal nextTokenId = 0;

  constructor(string _name, string _symbol) public ERC721Token(_name, _symbol) {}

  function mint() external {
    uint256 tokenId = nextTokenId;
    nextTokenId = nextTokenId.add(1);
    super._mint(msg.sender, tokenId);
  }

  function setTokenURI(uint256 _tokenId, string _message) external {
    super._setTokenURI(_tokenId, _message);
  }

  function burn(uint256 _tokenId) external {
    super._burn(msg.sender, _tokenId);
  }
}