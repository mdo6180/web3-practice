async function main() {

    // A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts, 
    // so HelloWorld here is a factory for instances of our hello world contract. 
    // When using the hardhat-ethers plugin ContractFactory and Contract, instances are connected to the first signer (owner) by default.
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
 
    // Start deployment, returning a promise that resolves to a contract object
    // Calling deploy() on a ContractFactory will start the deployment, and return a Promise that resolves to a Contract object. 
    // This is the object that has a method for each of our smart contract functions.
    const hello_world = await HelloWorld.deploy("Hello World!");
    console.log("Contract deployed to address:", hello_world.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });

// command to deploy smart contract:
// $ npx hardhat run scripts/deploy.js --network goerli

// Contract deployed to address: 0xF29a4d0b3B14fC5821AFa4F11506423a68a0D0b4
// second deployment to address: 0x0a016F48c77b4b10C3964B1efDD81d1f51ca4F80
// third deployment to adress: 0xFf5505dfA781D42dc55f665190D684c3cA0D6929