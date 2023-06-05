// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;


interface IERC20 { 

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint);

    function transfer(address receiver, uint amount) external;

}


contract MyToken is IERC20 

{


    string public constant name="CromaCampus";

    string public constant symbol="CRC";

    uint8 public constant decimal=8;

    address owner;
     mapping (address=>uint256) balances;


    mapping (address=>mapping (address=>uint)) allowed;


    uint totalSupply_=1000 wei;


    constructor() public {

        balances[msg.sender]=totalSupply_;

        owner=msg.sender;
    }
     function totalSupply() public override  view returns (uint256){

        return totalSupply_; 
    }
    
    function balanceOf(address account)  public override view returns (uint){

        return balances[account];

    }
    
    function transfer(address receiver, uint amount) public override

    {
       require(amount<=balances[msg.sender], "You don't have enough balance");

        balances[msg.sender]-=amount;

        balances[receiver]+=amount;
    }
    
     modifier onlyAdmin{

         require(owner==msg.sender,"You do not have access");_;

    }
      function mint (uint _qty) public onlyAdmin{

        totalSupply_+=_qty;

        balances[msg.sender]+=_qty;

    }
    
    function burn (uint _qty) public onlyAdmin{

            require(balances[msg.sender]>=_qty, "You don't have enough tokens");

        totalSupply_-=_qty;

        balances[msg.sender]-=_qty;
    }
    
    function approve(address _spender,uint value) public {

        require(balances[msg.sender]>=value, "You don't have enough tokens");

        allowed[msg.sender][_spender]=value;

    }
    function transferFrom(address _from, address to, uint _value) public{

        require(allowed[_from][msg.sender]>=_value, "You don't have access enough tokens");

        balances[to]+=_value;

        balances[_from]-=_value;

       allowed[_from][msg.sender]-=_value;

    }
    
    function showAccess(address _from) public view  returns (uint){

        return allowed[_from][msg.sender];

    }
}

 

 


   
