// SPDX-License-Identifier: UNLICENSED

// Specifies the version of Solidity, using semantic versioning.
// Learn more: https://solidity.readthedocs.io/en/v0.5.10/layout-of-source-files.html#pragma
pragma solidity >=0.7.3;

// Defines a contract named `HelloWorld`.
// A contract is a collection of functions and data (its state). 
// Once deployed, a contract resides at a specific address on the Ethereum blockchain. 
// Learn more: https://solidity.readthedocs.io/en/v0.5.10/structure-of-a-contract.html
contract HelloWorld {

   // Emitted when update function is called
   // Smart contract events are a way for your contract to communicate that something happened on the blockchain to your app front-end, 
   // which can be 'listening' for certain events and take action when they happen.
   event UpdatedMessages(string oldStr, string newStr);

   // Declares a state variable `message` of type `string`.
   // State variables are variables whose values are permanently stored in contract storage. 
   // The keyword `public` makes variables accessible from outside a contract and creates a function 
   // that other contracts or clients can call to access the value.
   string public message;

   // Similar to many class-based object-oriented languages, 
   // a constructor is a special function that is only executed upon contract creation.
   // Constructors are used to initialize the contract's data. 
   // Learn more:https://solidity.readthedocs.io/en/v0.5.10/contracts.html#constructors
   constructor(string memory initMessage) {

      // Accepts a string argument `initMessage` and sets the value into the contract's `message` storage variable).
      message = initMessage;
   }

   // A public function that accepts a string argument and updates the `message` storage variable.
   function update(string memory newMessage) public {
      string memory oldMsg = message;
      message = newMessage;
      emit UpdatedMessages(oldMsg, newMessage);
   }
}

// There's a number of key concepts defining Ethereum smart contracts that differ from a web2 development paradigm.

// Types
// In Solidity, the contract type is a struct that organizes a set of related functions around a single purpose.
// Address types are Ethereum addresses that equate to 20 bytes, and are represented in hexadecimal form beginning with the prefix 0x.
// Most other types will be familiar to you as a developer - including booleans, integers, fixed-point numbers, byte arrays, and literals.

// Data Storage
// In Solidity, reference data values can be stored as storage, memory or calldata depending on the role of the data stored. In particular: 
// - storage keeps the data permanently on the blockchain, and is extremely expensive.
// - memory values are stored only for the lifetime of the smart contract's execution, 
//   and are inexpensive to use (costing only small amounts of gas).
// - calldata is a special data location that contains the function arguments, and is only available for external function call parameters.

// Function Modifiers
// Functions exist to get / set information based on calls initiated by external transactions. 
// In particular, a smart contract can never run unless initiated by an external transaction - they don't execute silently in the background.

// Access modifiers include: 
// public: Can be accessed by all functions or callers
// external: Can be accessed only by external callers, not internal functions
// internal: Can be accessed only by this contract, or contracts deriving from it
// private: Can be accessed only from this contract itself

// Other modifiers include: 
// view: This guarantees that the function will not modify the state of the contract's data (or data in storage).
// pure: This guarantees that the function with neither read nor modify the state of the contract's data.
// payable: Functions and addresses declared payable can receive ether into their contracts.

// Special Functions and Variables
// There are a number of global variables and functions that will be helpful to remember you have access to! Some special variables are: 
// - block.number (uint256): The number of the most recent block.
// - block.timestamp (uint256): The UNIX timestamp of the most recent block.
// - block.gaslimit (uint256): The gas limit of the current block.
// - msg.sender (address payable): The sender of the transaction triggering the contract.
// - msg.value (uint256): The number of wei transferred with the message.

// Special functions include: 
// - receive(): Contracts may only have one of these functions declared. 
//   It serves as the default destination when a contract is sent Ether. 
//   It cannot have arguments, return anything, and must be external and payable.
// - fallback(): Contracts may only have one of these functions declared. 
//   It serves as the fallback if a call to the contract does not match any function, 
//   or if no data was supplied and the receive() function was not declared. 
//   It cannot have arguments, return anything, and must be external.

// Events
// Solidity events are roughly equivalent to logging in other programming paradigms. 
// They're emitted when a contract is executed, stored permanently on the blockchain, 
// but aren't accessible to be modified / read by smart contracts.

// Events can be accessed in a variety of different ways:
// Events are stored in the receipts of transactions, and can be accessed there.
// You can subscribe to an event with myContract.events.TestEvent([options][, callback])
// You can request past events using a request like myContract.getPastEvents(event[, options][, callback]).