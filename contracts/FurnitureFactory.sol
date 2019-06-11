pragma solidity ^0.5.0;

import "./ownable.sol";
import "./safemath.sol";

contract FurnitureFactory is Ownable {

  using SafeMath for uint256;
  using SafeMath32 for uint32;
  using SafeMath16 for uint16;

  event NewFurniture(uint furnitureId, string name, uint level);

  struct Furniture {
    string name;
    uint level;
  }

  Furniture[] public furnitures;

  mapping (uint => address) public furnitureToOwner;
  mapping (address => uint) ownerFurnitureCount;

  function createFurniture(string memory _name, uint _level) public {
    uint id = furnitures.push(Furniture(_name, _level)) - 1;
    furnitureToOwner[id] = msg.sender;
    ownerFurnitureCount[msg.sender] = ownerFurnitureCount[msg.sender].add(1);
    emit NewFurniture(id, _name, _level);
  }
}
