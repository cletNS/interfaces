// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

error CletPay__Empty();
error CletPay__Expired();
error CletPay__NotForSale();
error CletPay__Unauthorized();
error CletPay__InValidToken();
error CletPay__PaymentFailed();
error CletPay__NameUnavailable();
error CletPay__InsufficientFunds();

interface ICletPay {
    event Paid(
        string _name,
        uint256 _years,
        address indexed _user,
        string _soldBy,
        uint256 _amtPaid_USD,
        uint256 _partnerWeiSent
    );

    event AcquireListed(
        string _name,
        address indexed _buyer,
        address indexed _seller,
        uint256 _amtPaid_USD,
        uint256 _sellerWeiSent,
        uint256 _cletWeiCommission
    );

    /// @notice Unlocks any available name on the SKALE Chain
    function pay(
        string memory _name,
        uint256 _years,
        address _partner
    ) external payable;

    /// @notice Adds specified number of years to an existing name
    function addYears(string memory _name, uint256 _years) external payable;

    /// @notice Returns the price of a name based on number of years
    function getAmountToPay(string memory _name, uint256 _years) external view;

    /// @notice Returns the current ETH value in USD
    function getEthPrice() external view returns (uint256);

    /// @notice Allows a user to set or update the cost price of an owned name
    function setListingPrice(string memory _name, uint256 _amount) external;

    /// @notice Acquires a non-expired listed name
    function buyListedName(string memory _name) external payable;

    // @notice Returns all listed names
    function getAllListedNames() external view returns (string[] memory);

    // @notice Returns number of listed names
    function getListedNamesCount() external view returns (uint256);

    // @notice Transfers an owned name to a new owner
    // @dev Call this function before transfer on SKALE Chain
    function transferName(string memory _name, address _newOwner) external;

    // @notice Checks if a name is available
    function nameExists(string memory _name) external view returns (bool);

    // @dev Checks if a name is expired
    function isExpired(string memory _name) external view returns (bool);
}
