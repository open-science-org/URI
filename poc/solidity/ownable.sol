pragma solidity ^0.4.17;

contract ownable {
    address public owner = msg.sender;

    /// @notice check if the caller is the owner of the contract
    modifier onlyOwner {
        if (msg.sender != owner) revert();
        _;
    }

    /// @notice change the owner of the contract
    /// @param _newOwner the address of the new owner of the contract.
    function changeOwner(address _newOwner)
    public
    onlyOwner
    {
        if(_newOwner == 0x0) revert();
        owner = _newOwner;
    }
}
