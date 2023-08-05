// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract PracticumOne {

    constructor() {
        owner = msg.sender;
    }

    address public owner;

    bool public isPaused = false;

    mapping (address=>uint256) balances;

    uint8 constant CONST = 1;

    uint256 public uintVal = 0;

    uint256[10] public fixedArray;
    uint256[] public dynamicArray;


    enum Status {First, Second, Third}

    Status myEnum;


    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier zeroAddr(address _addr) {
        require(_addr != address(0), "Zero address");
        _;
    }

    event FirstEvent(address _from, uint value);
    event SecondEvent(address _from, uint _timestamp);

    error NotAnOwner(address _user);

    ///////////////////////////////////////////

    function increaseUint() public {
        uintVal++;
    }

    function decreaseUintWithConstant() public{
        uintVal-=CONST;
    }

    function increaseUint(uint256 firstNumber, uint256 secondNumber) public{
        uintVal = uintVal + firstNumber + secondNumber + CONST;

    }

    function setValueInMapping () public {

        balances[msg.sender] = uintVal;

    }

    function addToFixedArray(uint begin, uint end) public {

        for(uint i = begin; i<end; i++){

            fixedArray[i] = uintVal;

        }

    }

    function deleteFromFixedArray(uint position) public {

       delete fixedArray[position];

    }
    
    function popFromDynamicArray() public {

        dynamicArray.pop();

    }

    function arrayLength() public view returns (uint) {

        return dynamicArray.length;

    }

    function changeOwner(address newOwner) public onlyOwner zeroAddr(newOwner) {
        owner = newOwner;
    }

    function cycleArray() public {

        for(uint i = 0; i<10; i++){

            fixedArray[i] = uintVal;

        }
    }

    function zeroingMappingWithEnum() public {
        balances[msg.sender] = 0;
        myEnum = Status.Second;

    }

    function addToArrayWithEvent(uint position, uint value) public {
        fixedArray[position] = value;
        emit FirstEvent(msg.sender, value);
    }

    function sumWithCheck(uint firstNumber, uint secondNumber) public {

        require(firstNumber + secondNumber > 10, "Too low!");

        uintVal = firstNumber + secondNumber;

    }

    function ternaryUint() public returns(uint) {

        uintVal = uintVal > 10 ? uintVal : 0;
        return uintVal;

    }

    function changeWithError() public {

        if (msg.sender != owner){
            revert NotAnOwner({_user: msg.sender});
        }

        balances[msg.sender] = 10000000;

    }
    
    function getFromArray(uint position) public view returns(uint) {

        return fixedArray[position];

    }


}
