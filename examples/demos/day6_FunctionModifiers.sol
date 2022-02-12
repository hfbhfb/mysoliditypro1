pragma solidity ^0.4.25;

contract StateVariables {
    string name;
    uint public rename_counter;
    address owner;

    constructor() public {
        name = "unknown";
        owner = msg.sender;
        rename_counter = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Permissioin denied");
        // require(condition,<String>)
        // String 可用来说明 condiftion 失败的原因
        _;
    }

    function setName(string _name) public onlyOwner returns (string) {
        rename_counter += 1;
        name = _name;
        return name;
    }

    function getName() public view returns (string) {
        return name;
    }
}
