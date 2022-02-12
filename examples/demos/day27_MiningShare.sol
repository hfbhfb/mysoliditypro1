pragma solidity ^0.4.25;

// 挖矿合资

// 查询自己的投资金额
// 查询自己的提领金额
// 目前的挖矿收益
// 领ether出来

import "./browser/SafeMath.sol";

contract MiningShare {
    using SafeMath for uint256;
    // 召集人
    address private owner = 0x0;
    // 召集人设定时间
    uint256 private closeBlock = 0;
    // 投资者:
    // 1.投资金额
    mapping(address => uint256) private usersNTD;
    // 2.提领金额
    mapping(address => uint256) private usersWithdraw;
    // 记录参数
    // 1.总投资金额
    uint256 private totalNTD = 0;
    // 2.总提领金额
    uint256 private totalWithdraw = 0;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    modifier beforeCloseBlock() {
        require(block.number <= closeBlock);
        _;
    }
    modifier onlyShareHolders() {
        require(usersNTD[msg.sender] != 0);
        _;
    }

    constructor() public {
        owner = msg.sender;
        closeBlock = block.number + 2000;
    }

    function CapitalIncrease(address account, uint256 NTD)
        public
        onlyOwner
        beforeCloseBlock
    {
        usersNTD[account] = usersNTD[account].add(NTD);
        totalNTD = totalNTD.add(NTD);
    }

    function Capitaldecrease(address account, uint256 NTD)
        public
        onlyOwner
        beforeCloseBlock
    {
        usersNTD[account] = usersNTD[account].sub(NTD);
        totalNTD = totalNTD.sub(NTD);
    }

    function myTotalNTD() public constant onlyShareHolders returns (uint256) {
        return usersNTD[msg.sender];
    }

    function MyTotalWithdraw()
        public
        constant
        onlyShareHolders
        returns (uint256)
    {
        return usersWithdraw[msg.sender];
    }

    function TotalMined() public constant onlyShareHolders returns (uint256) {
        return totalWithdraw.add(address(this).balance);
    }

    function Withdraw() public constant onlyShareHolders returns (uint256) {
        uint256 totalMained = totalWithdraw.add(address(this).balance);
        // 不算...具体看视频
        return 1;
    }
}
