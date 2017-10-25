pragma solidity ^0.4.17;

import "ownable.sol";

contract mortal is ownable {
    // This contract inherits the "onlyOwner"-modifier from
    // "owned" and applies it to the "close"-function, which
    // causes that calls to "close" only have an effect if
    // they are made by the stored owner.
    function kill()
    public
    onlyOwner
    {
        selfdestruct(owner);
    }
}
