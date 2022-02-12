pragma solidity ^0.4.25;

contract Test {
    bool isValid;

    constructor() public {
        isValid = false;
    }

    function f1() public returns (int256) {
        isValid = false;
        assert(false);
        return 0;
    }

    function f2() public returns (int256) {
        isValid = false;
        require(false, "REQUIRE");
        return 0;
    }

    function f3() public returns (int256) {
        isValid = false;
        revert("REVERT");
        return 0;
    }
}
