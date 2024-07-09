// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";


contract TentoToken is ERC20 {
    address _owner;
    constructor(string memory name, string memory symbol,uint supply) ERC20(name, symbol) {
         _owner = msg.sender;
         _mint(msg.sender,supply);
    }

    function Mintto(address toAddress, uint supply) public {
        require(msg.sender == _owner,"Only Owner can min the tokesn");
        _mint(toAddress, supply);
    }

    function Burnto(uint supply) public {
        if(balanceOf(msg.sender) < supply){
            revert("You Don't have enough Tokens");
        }

        _burn(msg.sender, supply);
    }

    function NowTransfer(address toAddress,uint supply) public {
        if(balanceOf(msg.sender) < supply){
            revert("You Don't have enough Tokens");
        }
        _transfer(msg.sender, toAddress, supply);

    }

}