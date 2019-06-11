# product_tracing
This is a product tracing system for furniture based on Ethereum.
During the production process of the furniture, all the phases are recorded in the blockchain,
so, if the end user buy a furniture with defects, we can trace all the processing history and 
find who should be responsible for this.
The phases can be described as Casting, Welding, Polishing, Painting, Packaging.
In the solidity source code, we use level to represent the status of the furniture,
Casting(0), Welding(1), Polishing(2), Painting(3), Packaging(4).
Based on truffle, ganache, drizzle and reactjs.