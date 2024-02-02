// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract XfishToken is ERC20, Ownable, ERC20Burnable {
    using SafeMath for uint256;

    constructor() ERC20("XFish", "XFish") {
        _mint(owner(), 100000000 * (10 ** 18));
    }
}
