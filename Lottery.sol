//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Lottery{
    address payable[] public participants;
    address public manager;

    constructor()
    {
        manager= msg.sender;
    }

    receive() external payable
    {
        require(msg.value==1 ether);
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(msg.sender== manager);
        return address(this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    function selectWinner() public{
        require(msg.sender==manager);
        require(participants.length>=3);
        uint r = random();
        uint idx = r%3;
        address payable winnner;
        winnner= participants[idx];
        winnner.transfer(getBalance());
        participants = new address payable[](0);
    }
}
