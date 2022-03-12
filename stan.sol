// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


contract stanlee{
    uint256 public stan;
    uint256 public index; 
    address myAccount = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    struct User {
         uint256 index;
         string name;
         address wallet;
         uint256 balance;
    }

    mapping(address => User[]) public users;

    constructor(uint256 _stan){
       stan = _stan;
    }
    function getBalance() public view returns (uint256){
        return stan;
    }

    function buyToken(string memory _name , address payable _wallet  , uint256  _tokens ) public payable{

        if(stan != 0){

            index ++;

            stan -= _tokens;

            // (bool sent, bytes memory data) = _wallet.call{value: _tokens * 2 }("");

            // require(sent, "Failed to send Ether");

            User memory _user = User({index: index, name: _name , wallet: _wallet , balance: _tokens});

            users[_wallet].push(_user);
        }
    }

    function getAccount(address _wallet) public view returns (User[] memory){
        return users[_wallet];
    }

}