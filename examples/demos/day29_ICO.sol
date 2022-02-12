pragma solidity ^0.4.25;

// ICO(contract) -> Token(contract)

// 特定人 或者 特写区块后

import "./browser/SafeMath.sol";

contract MyICOContract {
    using SafeMath for uint256;
    address private owner = 0x0;
    address private tokenAddress = 0x0;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    enum ICOState {
        PREPARE,
        START,
        END
    }
    ICOState icoState = ICOState.PREPARE;

    modifier beforeICO() {
        require(icoState == ICOState.PREPARE);
        _;
    }

    modifier whenICOStart() {
        require(icoState == ICOState.START);
        _;
    }

    modifier whenICOEnd() {
        require(icoState == ICOState.END);
        _;
    }

    constructor() public {
        string memory name = "HYDAIToken";
        uint8 decimals = 18;
        string memory symbol = "HYT";
        uint256 totalSupply = 1000 * (10**18);
        // Set name
        // Set decimals
        // Set symbol
        // Set totalSupply
    }
}
