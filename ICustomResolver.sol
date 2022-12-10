// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ICustomResolver {
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

    function resolve(
        string memory _name_ticker
    ) external view returns (MappedAddress memory);

    function reverseLookup(
        string memory _address
    ) external view returns (string memory);
}
