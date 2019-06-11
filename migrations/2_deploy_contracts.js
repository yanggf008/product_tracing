const FurnitureFactory = artifacts.require("FurnitureFactory");
const FurnitureOwnership = artifacts.require("FurnitureOwnership");
const FurnitureHelper = artifacts.require("FurnitureHelper");
const Ownable = artifacts.require("Ownable");

module.exports = function(deployer) {
	deployer.deploy(FurnitureFactory);
	deployer.deploy(FurnitureOwnership);
	deployer.deploy(FurnitureHelper);
	deployer.deploy(Ownable);
};