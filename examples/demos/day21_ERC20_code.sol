pragma solidity ^0.4.25;

import "./browser/SafeMath.sol";
import "./browser/IERC20.sol";

// 这个不能直接跑起来,,直接学习代币样例
// https://github.com/ConsenSys/Tokens/blob/master/contracts/eip20/EIP20.sol
// https://github.com/ConsenSys/Tokens/blob/master/contracts/eip20/EIP20Interface.sol

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    string public constant name = "haha token";
    uint8 public constant decimals = 18;
    string public constant symbol = "HHT";

    uint256 private _totalSupply;
    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _approve;

    // 所有存在的 Token 数量
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    // 读取 tokenOwner 这个 address 所持有的 Token 数量
    function balanceOf(address tokenOwner)
        external
        view
        returns (uint256 balance)
    {
        return _balances[tokenOwner];
    }

    // 从 msg.sender 转tokens 个 Token 给 to 这个 address
    function transfer(address to, uint256 tokens)
        external
        returns (bool success)
    {
        return _tansfer(msg.sender, to, tokens);
    }

    // 得到 tokenOwner 授权给 spender 使用 Token 剩余数量
    function allowance(address tokenOwner, address spender)
        external
        view
        returns (uint256 remaining)
    {
        return _approve[tokenOwner][spender];
    }

    // msg.sender 授权给 spender 可使用自己的tokens 个 Token
    function approve(address spender, uint256 tokens)
        external
        view
        returns (bool success)
    {
        _approve[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    // 转 tokens 个 Token 从 from 转到 to
    function transferFrom(
        address from,
        address to,
        uint256 tokens
    ) external returns (bool success) {
        _approve[from][msg.sender] = _approve[from][msg.sender].sub(tokens);
        return _tansfer(from, to, tokens);
    }

    function _tansfer(
        address from,
        address to,
        uint256 tokens
    ) internal returns (bool success) {
        _balances[msg.sender] = _balances[msg.sender].sub(tokens);
        _balances[to] = _balances[to].add(tokens);

        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}
