pragma solidity ^0.4.17;

import "ownable.sol";
import "mortal.sol";

contract uri is ownable, mortal {
    // This contract inherits the "onlyOwner"-modifier from
    // "owned" and the "kill" function from "mortal".  Used
    // as basic builders for contracts it allows for importing
    // logic and functionality to ensure only those who should
    // access a contract can, typically the contract owner.

    struct Authenticate {
        bytes32 civicId;
        bytes32 uPortId;
        // ethAddress is not necessary but used as reference to
        // indicate multiple ETH addresses can be associated to 1 URI.
        // address ethAddress;
    }

    struct Researcher {
        bytes32 googleScholarId;
        bytes32 emailAddress;
        bytes32 firstName;
        bytes32 lastName;
        bytes32 institution;
        bytes32 company;
        mapping (address => Authenticate) authenticates;
    }

    uint numResearchers;
    // The research ID should be something other than an increasing integer.
    // This is being used as part of the POC to show functionality.
    mapping (uint => Researcher) public researchers;

    function newResearcher()
    public
    returns (uint osoId)
    {
        // Return variable used to reference the effective URI
        osoId = numResearchers++;
        // Build a dummy Researcher "class"
        researchers[osoId] = Researcher("", "", "", "", "", "");
    }

    // Demonstration of setting individual values as part of Researcher.
    function setGoogleScholarId(uint osoId, bytes32 googleScholarId)
    public
    {
        researchers[osoId].googleScholarId = googleScholarId;
    }

    // Demonstration of retrieving individual values as part of Researcher.
    function getGoogleScholarId(uint osoId)
    public
    view
    returns (bytes32)
    {
        return researchers[osoId].googleScholarId;
    }

    // Demonstration of setting multiple values as part of Researcher.
    function setUserDetails(uint osoId, bytes32 emailAddress, bytes32 firstName, bytes32 lastName, bytes32 institution, bytes32 company)
    public
    {
        researchers[osoId] = Researcher(getGoogleScholarId(osoId), emailAddress, firstName, lastName, institution, company);
    }

    // Demonstration of retrieving multiple values as part of Researcher.
    function getUserDetails(uint osoId)
    public
    view
    returns (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32)
    {
        Researcher storage r = researchers[osoId];
        return (r.googleScholarId, r.emailAddress, r.firstName, r.lastName, r.institution, r.company);
    }

    // Demonstration of setting Authentication details based on the preferred
    // Authentication mechanism for each Ethereum Address.
    function setAuthenticationDetails(uint osoId, bytes32 civicAuth, bytes32 uPortAuth)
    public
    {
        Researcher storage r = researchers[osoId];
        r.authenticates[msg.sender] = Authenticate({civicId: civicAuth, uPortId: uPortAuth});
    }

    // Demonstration of retrieving Authentication details based on URI and Ethereum Address.
    function getAuthenticationDetails(uint osoId)
    public
    view
    returns (bytes32, bytes32)
    {
        Researcher storage r = researchers[osoId];
        return (r.authenticates[msg.sender].civicId, r.authenticates[msg.sender].uPortId);
    }
}
