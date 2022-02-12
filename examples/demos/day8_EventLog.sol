pragma solidity ^0.4.25;

contract TestMapping {
    // mapping <T1,T2>
    mapping(address => uint256) public ledger;
    mapping(address => bool) public donors;
    address[] public donorList;
    event LogValue(uint256 balance);
    event LogAddress(address[] list);

    function isDonor(address pAddr) internal view returns (bool) {
        return donors[pAddr];
    }

    function donate() public payable {
        if (msg.sender.balance >= 1 ether) {
            if (!isDonor(msg.sender)) {
                donors[msg.sender] = true;
                donorList.push(msg.sender);
            }
            ledger[msg.sender] += msg.value;
            LogValue(msg.value);
        } else {
            // LogValue(msg.value);
            LogValue(msg.sender.balance);
            revert("<1 ether");
        }
    }
}
