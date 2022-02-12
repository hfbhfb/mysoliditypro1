pragma solidity ^0.4.25;

contract TestDonation {
    struct DonorInfo {
        address[] donors;
        mapping(address => uint256) ledger;
    }
    mapping(address => DonorInfo) DonotionHistory;
    event LogDonate(
        address streamer,
        address donor,
        string nickname,
        uint256 value,
        string message
    );

    function donate(
        address _streamer,
        string _nickname,
        string _message
    ) public payable {
        _streamer.transfer(msg.value);

        if (DonotionHistory[_streamer].ledger[msg.sender] == 0) {
            DonotionHistory[_streamer].donors.push(msg.sender);
        }
        DonotionHistory[_streamer].ledger[msg.sender] += msg.value;
        emit LogDonate(_streamer, msg.sender, _nickname, msg.value, _message);
    }

    function getDonorList() public view returns (address[]) {
        return DonotionHistory[msg.sender].donors;
    }

    event LogListDonorInfo(address _streamer, address user, uint256 value);

    function listDonorInfo() public {
        for (
            uint256 i = 0;
            i < DonotionHistory[msg.sender].donors.length;
            i++
        ) {
            address user = DonotionHistory[msg.sender].donors[i];
            emit LogListDonorInfo(
                msg.sender,
                user,
                DonotionHistory[msg.sender].ledger[user]
            );
        }
    }
}
