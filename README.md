**[Jump To Core Contract](#core-contract)**
<br/>

# **Pay Contract**

This contract serves as a payment gateway for acquiring clet names.
<br />
<br />

**Contract Addresses**

- Goerli (Testnet) - `0xeB918BdAD1B3205431A80dC1a0Ddf8F010C1A427`
- Ethereum Mainnet - `0xb6D45DA9512002F24E599559bEF3ec8C5568E286`
  <br />
  <br />
  > **⚠ NOTICE!** : _All function inputs must be lowercase to prevent undesirable results_

**Functions**:

- [_pay_](#1-function-pay)
- [_addYears_](#2-function-addyears)
- [_getAmountToPay_](#3-function-getamounttopay)
- [_getEthPrice_](#4-function-getethprice)
- [_setListingPrice_](#5-function-setlistingprice)
- [_buyListedName_](#6-function-buylistedname)
- [_getAllListedNames_](#7-function-getAllListedNames)
- [_getListedNamesCount_](#8-function-getListedNamesCount)
- [_transferName_](#9-function-transfername)
- [_nameExists_](#10-function-nameexists)
- [_isExpired_](#11-function-isexpired)

## 1. **function _pay_**

---

This function takes three parameters, **'name'** of type **_string_**, **'years'** of type **_integer_** and **'partner'** of type **_address_**. It unlocks any available name on the **SKALE** Chain.

```shell
function pay(string memory _name, uint256 _years, address _partner) external payable;
```

## 2. **function _addYears_**

---

This function takes two parameters, **'name'** of type **_string_** abd **'years'** of type **_integer_**. It adds specified number of years to an existing name.

```shell
function addYears(string memory _name, uint256 _years) external payable;
```

## 3. **function _getAmountToPay_**

---

This function takes two parameters, **'name'** of type **_string_** and **'years'** of type **_integer_**. It returns the price of a name based on number of years.

```shell
function getAmountToPay(string memory _name, uint256 _years) external view;
```

## 4. **function _getEthPrice_**

---

This function returns the current ETH value in USD.

```shell
function getEthPrice() external view returns (uint256);
```

## 5. **function _setListingPrice_**

---

This function takes two parameters, **'name'** of type **_string_** and **'amount'** of type **_integer_**. It allows a user to set the cost price of an owned name.

```shell
function setListingPrice(string memory _name, uint256 _amount) external;
```

## 6. **function _buyListedName_**

---

This function takes one parameter, **'name'** of type **_string_**. It acquires a non-expired listed name.

```shell
function buyListedName(string memory _name) external payable;
```

## 7. **function _getAllListedNames_**

---

This function returns all listed names

```shell
function getAllListedNames() external view returns (string[] memory);
```

## 8. **function _getListedNamesCount_**

---

This function returns the number of listed names

```shell
function getListedNamesCount()external view returns (uint256);
```

## 9. **function _transferName_**

---

This function takes two parameters, **'name'** of type **_string_** and **'newOwner'** of type **_address_**. It transfers an owned name to a new owner. The function is also called before transfer on **SKALE** Chain

```shell
function transferName(string memory _name, address _newOwner) external;
```

## 10. **function _nameExists_**

---

This function takes one parameter, **'name'** of type **_string_** and returns a boolean value. It checks if a name is owned.

```shell
function nameExists(string memory _name) external view returns (bool);
```

## 11. **function _isExpired_**

---

This function takes one parameter, **'name'** of type **_string_** and returns a boolean value. It checks if a name is expired.

```shell
function isExpired(string memory _name) external view returns (bool);
```

<br/>
<br/>
<br/>

# **Core Contract**

This contract is used to manage clet names.
<br />

**Contract Addresses**

- SKALE Testnet - `0xccC03A6E22C919921E234D5c5a40577b64e84450`
- SKALE Mainnet - `0x8dee8633c228418bbB4D946946308aDDb40bBe92`

<br/>

**SKALE Testnet Network Details**

```shell
Network name: SKALE Testnet
RPC URL: https://staging-v2.skalenodes.com/v1/attractive-merope
Chain ID: 1211818568165862
Currency symbol: sFUEL
```

<br/>

**Calypso Hub Network Details (SKALE Mainnet)**

```shell
Network name: ?
RPC URL: ?
Chain ID: ?
Currency symbol: ?
```

**Functions**:

- [_resolve_](#1-function-resolve)
- [_map_](#2-function-map)
- [_transferName_](#3-function-transfername)
- [_getOwner_](#4-function-getowner)
- [_getCount_](#5-function-getcount)
- [_getTickers_](#6-function-gettickers)
- [_getAllNames_](#7-function-getallnames)
- [_getOwnedNames_](#8-function-getownednames)
- [_getAllMappedInfo_](#9-function-getallmappedinfo)
- [_reverseLookup_](#10-function-reverselookup)

## 1. **function _resolve_**

---

This function takes two parameters, **\_name_ticker** of type **_string_**.
It returns the mapped details of a name.ticker

```shell
 function resolve(string memory _name_ticker)
```

## 2. **function _map_**

---

This function takes three parameters, **address** of type **_string_**, **name** of type **_string_** and **tickerIndex** of type **\*integer**. It maps a new address to specified chain

```shell
 function map(string memory _address, string memory _name, uint256 _tickerIndex)
```

## 3. **function _transferName_**

---

This function takes two parameters, **name** of type **_string_** and **newOwner** of type **_address_**
It transfers an existing owned name to another account.

```shell
 function transferName(string memory _name, address _newOwner)
```

## 4. **function _getOwner_**

---

This function takes one parameter, **name** of type **_string_**. It returns the the owner of a clet name.

```shell
function getOwner(string memory _name) public view returns (address)
 {
        return name_ToOwner[_name];
 }
```

## 5. **function _getCount_**

---

This function returns the total number of names in the contract.

```shell
 function getCount() public view returns (uint256) {
        return s_CletNames.length;
}
```

## 6. **function _getTickers_**

---

This function returns an array of **valid** tickers.

```shell
function getTickers() public view returns (Ticker[] memory) {
        return s_Tickers;
    }
```

## 7. **function _getAllNames_**

---

This function returns all exisiting names in the contract.

```shell
 function getAllNames() public view returns (CletName[] memory) {
        return s_CletNames;
    }
```

## 8. **function _getOwnedNames_**

---

This function returns names belonging to an account.

```shell
 function getOwnedNames(address _owner)
```

## 9. **function _getAllMappedInfo_**

---

This function returns all mappedInfo of a name.

```shell
function getAllMappedInfo(string memory _name)
```

## 10. **function _reverseLookup_**

---

This function returns the name belonging to a mapped information.

```shell
 function reverseLookup(string memory _address)
```

<br/>
<br/>
<br/>

# **Join Our Community**

<!-- - [Clet - One Name For All Blockchains](https://www.clet.domains/) -->

- [Discord](https://discord.gg/TDedn26Hnc)
- [Twitter](https://twitter.com/cletNS)
