//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract solution{
    address public owner; //address var
    
    // 
    constructor(){ 
        owner=msg.sender;
    }

    //works like conditional logic 
    modifier onlyOwner(){
        require(msg.sender==owner,"not owner");
        _;
    }

    // setting new owner
    function newOwner(address _nowner) public onlyOwner{
        require(_nowner!= address(0),"Invalid address");
        owner=_nowner;
    }
}
