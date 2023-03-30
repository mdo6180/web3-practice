// interact.js

const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS;

// For Hardhat
const contract = require("../artifacts/contracts/HelloWorld.sol/HelloWorld.json");

// Print the contract ABI (Application Binary Interface) to the terminal
//console.log(JSON.stringify(contract.abi));

// Provider
const alchemyProvider = new ethers.providers.AlchemyProvider(network="goerli", API_KEY);

// Signer
const signer = new ethers.Wallet(PRIVATE_KEY, alchemyProvider);

// Contract
const helloWorldContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);

// call message function in our smart contract and read the init message
async function main() {
    const message = await helloWorldContract.message();
    console.log("The message is: " + message);
}
main();

// command to run interact.js
// $ npx hardhat run scripts/interact.js --network goerli

/*
// call the update function on our instantiated Contract object
async function main() {
    const message = await helloWorldContract.message();
    console.log("The message is: " + message);
  
    // Note that we make a call to .wait() on the returned transaction object. 
    // This ensures that our script waits for the transaction to be mined on the blockchain before proceeding onwards. 
    // If you were to leave this line out, your script may not be able to see the updated message value in your contract.
    console.log("Updating the message...");
    const tx = await helloWorldContract.update("This is the new message.");
    await tx.wait();

    const newMessage = await helloWorldContract.message();
    console.log("The new message is: " + newMessage);
}
main();
*/