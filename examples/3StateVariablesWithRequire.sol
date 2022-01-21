pragma solidity ^0.4.25;

contract StateVariables {
    string name;
    address owner;

    constructor() public {
        name = "unknown";
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Permissioin denied");
        _;
    }

    function setName(string _name) public onlyOwner returns (string) {
        name = _name;
        return name;
    }

    function getName() public view returns (string) {
        return name;
    }
}
