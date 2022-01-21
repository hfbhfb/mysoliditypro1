pragma solidity ^0.4.25;

contract StateVariables {
    string name;
    address owner;
    uint256 public rename_counter;

    constructor() public {
        name = "unknown";
        owner = msg.sender;
        rename_counter = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Permissioin denied");
        _;
    }

    function setName(string _name) public onlyOwner returns (string) {
        name = _name;
        rename_counter = rename_counter + 1;
        return name;
    }

    function getName() public view returns (string) {
        return name;
    }
}
