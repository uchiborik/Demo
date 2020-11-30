// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.7.0;

// OpenZeppelin トークン発行・管理に用いるライブラリ
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
// デモ用トークン
contract DemoToken is ERC20{
  uint INITIAL_SUPPLY = 10000;
  uint AMOUNT = 100;
  constructor() public ERC20("DemoToken", "DT"){
    _mint(msg.sender, INITIAL_SUPPLY);  // コントラクト発行アカウント(Remix 1番目のアカウント)
    _transfer(msg.sender,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, AMOUNT);  // ユーザA (Remix 2番目のアカウント)
    _transfer(msg.sender,0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, AMOUNT);  // ユーザB (Remix 3番目のアカウント)
  }
    
    // トークンを送る
    // 宛先,送信元, トークン量を指定する
    function _transferToken(address _from, address _to, uint256 _amount) internal {
        _approve(_from,_to,_amount);
        _transfer(_from, _to,_amount);
    }
}
