// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;


interface IERC20 { //interface ERC20

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint);

    function transfer(address receiver, uint amount) external;// returns (bool);

}


contract MyToken is IERC20  //contract ERC20Impl

{


    string public constant name="CromaCampus";

    string public constant symbol="CRC";

    uint8 public constant decimal=8;

    address owner;
}

 

 


   
