# デモ
## スマートコントラクト

予め発行した代用貨幣トークンを用いて、</br>
他ユーザ(送信者)によりタグの情報を変更された際に、</br>
持ち主から他ユーザ(送信者)へトークンが移動する

## Openzeppelinライブラリを用いる
トークン発行・管理するため、ERC20.solをインポート

## Remix IDEを用いる
https://remix.ethereum.org/#version=soljson-v0.6.12+commit.27d51765.js&optimize=false&runs=200&gist=

gist ID: 2df5a5ce90de8aae462e5c5a8e0ea259
(https://gist.github.com/uchiborik/2df5a5ce90de8aae462e5c5a8e0ea259)

### ファイル追加
BluePlatform.solとBlueToken.solを追加する

<div align="center">
<img width="372" alt="スクリーンショット 2020-11-24 15 23 15" src="https://user-images.githubusercontent.com/26053360/100056561-34f75400-2e69-11eb-9216-3e15d8bf0cd0.png">
</div>


### コンパイラ指定
Solidity（コンパイラ）はversion0.6.12を指定する</br>
BluePlatform.solを選択し、コンパイルする

<div align="center">
<img width="380" alt="スクリーンショット 2020-11-24 15 19 58" src="https://user-images.githubusercontent.com/26053360/100056319-d500ad80-2e68-11eb-9fb5-5952646a840b.png"> 
</div>


### コントラクト実行
- createTag
- sendPostion
- changePostion
- registerPostion
- getTagsByOwner
- getTagsById
