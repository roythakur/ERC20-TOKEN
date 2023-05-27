
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;


interface IERC20 { //interface ERC20

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint);

    function transfer(address receiver, uint amount) external;// returns (bool);

}