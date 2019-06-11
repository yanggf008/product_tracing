pragma solidity ^0.5.0;

import "./furniturehelper.sol";
import "./erc721.sol";
import "./safemath.sol";

/// @title A contract to make furniture tradable
/// @author Guofeng Yang
/// @notice It follows all the necessary operations of ECR721 Standard
contract FurnitureOwnership is FurnitureHelper, ERC721 {

  using SafeMath for uint256;

  mapping (uint => address) furnitureApprovals;

  function balanceOf(address _owner) public view returns (uint256 _balance) {
    return ownerFurnitureCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public view returns (address _owner) {
    return furnitureToOwner[_tokenId];
  }

  function _transfer(address _from, address _to, uint256 _tokenId) private preLevel(_tokenId){
    ownerFurnitureCount[_to] = ownerFurnitureCount[_to].add(1);
    ownerFurnitureCount[_from] = ownerFurnitureCount[_from].sub(1);
    furnitureToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transfer(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
    _transfer(msg.sender, _to, _tokenId);
  }

  function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
    furnitureApprovals[_tokenId] = _to;
    emit Approval(msg.sender, _to, _tokenId);
  }

  function confirm(uint256 _tokenId) public onlyOwnerOf(_tokenId) {
    furnitures[_tokenId].level++;
  }

  function takeOwnership(uint256 _tokenId) public {
    require(furnitureApprovals[_tokenId] == msg.sender);
    address owner = ownerOf(_tokenId);
    _transfer(owner, msg.sender, _tokenId);
  }
}
