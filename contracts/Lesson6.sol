// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract Demo {

    address owner;

    event Paid(address _from, uint _amount, uint _timestamp);


    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner(address _to) {
        require(msg.sender == owner, "You are not owner!");
        require(_to != address(0), "Not valid address!");
        
        _;
    }

    function pay() external payable {
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    function withdraw(address payable _to) external onlyOwner(_to) {
        require(msg.sender == owner, "You are not owner");
        _to.transfer(address(this).balance);
    }

}