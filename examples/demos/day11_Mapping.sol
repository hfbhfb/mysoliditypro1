pragma solidity ^0.4.25;

contract TestMapping {
    // mapping <T1,T2>
    mapping(address => uint256) public ledger;
    mapping(address => bool) public donors;
    address[] public donorList;

    function isDonor(address pAddr) internal view returns (bool) {
        return donors[pAddr];
    }

    function donate() public payable {
        if (msg.value >= 1 ether) {
            if (isDonor(msg.sender)) {
                donors[msg.sender] = true;
                donorList.push(msg.sender);
            }
            ledger[msg.sender] += msg.value;
        } else {
            revert("<1 ether");
        }
    }
}
