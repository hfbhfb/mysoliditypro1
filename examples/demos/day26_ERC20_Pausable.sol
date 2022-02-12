pragma solidity ^0.4.25;

// 合约 暂停
// pausable

contract Pausable {
    bool private _paused;

    constructor() public {
        _paused = false;
    }

    modifier whenPaused() {
        require(_paused);
        _;
    }

    modifier whenNotPaused() {
        require(!_paused);
        _;
    }

    event Pause(address addr);
    event UnPause(address addr);

    function pause() public whenNotPaused returns (bool) {
        emit Pause(msg.sender);
        _paused = true;
        return true;
    }

    function unpause() public whenNotPaused returns (bool) {
        emit UnPause(msg.sender);
        _paused = false;
        return true;
    }

    function transfer() public whenNotPaused returns (bool) {}
}
