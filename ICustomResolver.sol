interface ICustomResolver.sol {
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

    /// @notice Returns the mapped details of a name.ticker
    /// @dev Returns type of MappedAddress
    function resolve(string memory _name_ticker)
        external
        view
        returns (MappedAddress memory);

    /// @notice Returns the name belonging to a mapped information
    function reverseLookup(string memory _address)
        external
        view
        returns (string memory);
}
