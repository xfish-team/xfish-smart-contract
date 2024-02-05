// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract XfishToken is ERC20, Ownable {
    using SafeMath for uint256;
    mapping(address => bool) public blackList;
    mapping(address => bool) public whiteList;

    address public uniswapV2Pool;
    bool public locked = true;
    uint256 public _sellLimitAmount = 2000 * (10 ** 18);
    bool public isLimitSell = true;

    constructor() ERC20("Xfish", "Xfish") {
        _mint(owner(), 100000000 * (10 ** 18));
    }

    function setLocked(bool _locked) public onlyOwner returns (bool) {
        locked = _locked;
        return true;
    }

    function setSellLimit(
        uint256 sellLimitAmount
    ) public onlyOwner returns (bool) {
        _sellLimitAmount = sellLimitAmount;
        return true;
    }

    function setIsLimitSell(bool _limitSell) public onlyOwner returns (bool) {
        isLimitSell = _limitSell;
        return true;
    }

    function addToBlackList(address _address) public onlyOwner {
        blackList[_address] = true;
    }

    function addToWhiteList(address _address) public onlyOwner {
        whiteList[_address] = true;
    }

    function setUniswapV2Pool(address _uniswapV2Pair) public onlyOwner {
        uniswapV2Pool = _uniswapV2Pair;
    }

    function removeFromBlackList(address _address) public onlyOwner {
        blackList[_address] = false;
    }

    function removeFromWhiteList(address _address) public onlyOwner {
        whiteList[_address] = false;
    }

    function isBlackList(address account) public view returns (bool) {
        return blackList[account];
    }

    function isWhiteList(address account) public view returns (bool) {
        return whiteList[account];
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual override {
        if (sender == owner()) {
            super._transfer(sender, recipient, amount);
            return;
        }
        if (isWhiteList(sender)) {
            super._transfer(sender, recipient, amount);
            return;
        }
        require(!locked, "Token is locked");
        require(
            !isBlackList(sender),
            "ERC20: transfer from the black list address"
        );
        require(
            !isBlackList(recipient),
            "ERC20: transfer to the black list address"
        );

        if (
            amount > _sellLimitAmount &&
            isLimitSell == true &&
            recipient == uniswapV2Pool
        ) {
            revert("Sell limit");
        }

        super._transfer(sender, recipient, amount);
    }
}
