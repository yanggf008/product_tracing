const FurnitureFactory = artifacts.require("./FurnitureFactory.sol");

contract("FurnitureFactory", accounts => {
  it("should store the string 'Hey there!'", async () => {
    const furnitureFactory = await FurnitureFactory.deployed();

    await furnitureFactory.createFurniture("Hey there!", 0);

    const storedString = await furnitureFactory.furnitures;

    assert.equal(storedString, {'name':'Hey there!', 'level': 0}, "The string was not stored");

  });
});