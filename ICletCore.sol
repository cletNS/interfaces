// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

error CletNameService__NameUnavailable();
error CletNameService__Unauthorized();
error CletNameService__AlreadyMapped();
error CletNameService__InsufficientFunds();
error CletNameService__NotForSale();
error CletNameService__Empty();

interface ICletCore {
    struct Ticker {
        string name;
        string ticker;
        string icon;
        string tag;
    }

    struct MappedAddress {
        Ticker ticker;
        string mappedAddress;
    }

    struct CletName {
        address owner;
        string name;
    }

    struct Expiry {
        uint256 startDate;
        uint256 endDate;
    }

    /// @notice Returns the mapped details of a name.ticker
    /// @dev Returns type of MappedAddress
    function resolve(string memory _name_ticker)
        external
        view
        returns (MappedAddress memory);

    /// @notice Maps a new address to specified chain
    /// @dev Use getTickers() to ensure index correctness
    function map(
        string memory _address,
        string memory _name,
        uint256 _tickerIndex
    ) external;

    /// @notice Transfers an existing owned name to another account
    function transferName(string memory _name, address _newOwner) external;

    /// @notice Returns the the owner of a clet name
    function getOwner(string memory _name) external view returns (address);

    /// @notice Returns the total number of names in the contract
    function getCount() external view returns (uint256);

    /// @notice Returns an array of valid tickers
    function getTickers() external view returns (Ticker[] memory);

    /// @notice Returns all exisiting names in the contract
    function getAllNames() external view returns (CletName[] memory);

    /// @notice Returns names belonging to an account
    function getOwnedNames(address _owner)
        external
        view
        returns (string[] memory);

    /// @notice Returns all mappedInfo of a name
    function getAllMappedInfo(string memory _name)
        external
        view
        returns (string[] memory);

    /// @notice Returns the name belonging to a mapped information
    function reverseLookup(string memory _address)
        external
        view
        returns (string memory);
}
