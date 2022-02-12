pragma solidity ^0.4.25;

contract TestFallBack {
    event LogFallBack(string message);
    event LogBalance(uint256 balance);

    constructor() public {
        emit LogFallBack("Fallback");
        emit LogBalance(address(this).balance);
        emit LogBalance(999);
    }
}
