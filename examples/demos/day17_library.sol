pragma solidity ^0.4.25;

library Set {
    struct Data {
        mapping(uint256 => bool) data;
    }

    function Insert(Data storage d, uint256 key) public returns (bool) {
        if (d.data[key]) {
            return false;
        }
        d.data[key] = true;
        return true;
    }

    function Remove(Data storage self, uint256 key) public returns (bool) {
        if (!self.data[key]) {
            return false;
        }
        self.data[key] = false;
        return true;
    }

    function Contain(Data storage self, uint256 key) public returns (bool) {
        return self.data[key];
    }
}

contract Main {
    Set.Data set;

    function insert(uint256 key) public returns (bool) {
        return Set.Insert(set, key);
    }

    function remove(uint256 key) public returns (bool) {
        return Set.Remove(set, key);
    }

    function contain(uint256 key) public returns (bool) {
        return Set.Contain(set, key);
    }
}
