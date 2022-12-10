// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "https://github.com/cletNS/interfaces/blob/master/ICustomResolver.sol";

interface ICustomNameService {
    struct Resolver {
        string baseTicker;
        string tickerName;
        string tickerIcon;
        string ticker;
    }

    /// @dev Do not include the ticker
    function resolve(
        string memory _name,
        uint256 _resolverIndex
    ) external view returns (ICustomResolver.MappedAddress memory);

    /// @notice Returns the name belonging to a mapped information
    function reverseLookup(
        string memory _addess,
        uint256 _resolverIndex
    ) external view returns (string memory);
}
