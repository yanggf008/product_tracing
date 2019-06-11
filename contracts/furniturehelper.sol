pragma solidity ^0.5.0;
import "./FurnitureFactory.sol";
contract FurnitureHelper is FurnitureFactory {

  modifier onlyOwnerOf(uint _furnitureId) {
    require(msg.sender == furnitureToOwner[_furnitureId]);
    _;
  }
  modifier preLevel(uint _furnitureId) {
    require(furnitures[_furnitureId].level <= 4);
    _;
  }

  function getFurnituresByOwner(address _owner) external view returns(uint[] memory) {
    uint[] memory result = new uint[](ownerFurnitureCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < furnitures.length; i++) {
      if (furnitureToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }

}