// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 < 0.7.0;
// コンパイラのversionを指定する
// 0.6.12を想定{version 6の中で最新なもの。ライブラリ(openzeppelin)のversionに依存する}
import "./DemoToken.sol";

// デモ用
contract Demo is DemoToken{
    constructor() public{
        createTag(10,10);
        createTag(11,11);
        createTag(12,12);
        createTag(13,13);
        createTag(14,14);
        
    }
    
    event NewTag(uint tagId, uint latitude, uint longitude); // イベントを定義
    
    // 状態変数 BC上に保存される
    // 構造体 {タグ情報}
    struct Tag{
        uint latitude;
        uint longitude;
    }
    
    Tag[] tags; // 配列化
    
    mapping (uint => address) public tagToOwner; // タグの所有者
    mapping (address => uint) ownerTagCount; // オーナー(ユーザアカウント)のタグ所有数
    
    // タグを登録する
    function createTag(uint _latitude, uint _longitude) public {
        tags.push(Tag({latitude: _latitude, longitude: _longitude}));
        uint tagId = tags.length -1;
        tagToOwner[tagId] = msg.sender;
        ownerTagCount[msg.sender]++;
        emit NewTag(tagId, _latitude, _longitude);
    }
    
    // 発見者(他ユーザ)が
    // タグの位置情報を更新する
    
    //  一対一
    // 紛失物の情報が提供されると、
    // 即時にタグの情報が更新され、トークン報酬が支払われる
    function changePostion(uint _tagId,uint _newlatitude, uint _newlongitude) external {
        require(msg.sender != tagToOwner[_tagId]);   // タグIDと整合性を保つため、 _tagIdから-1している
        tags[_tagId].latitude = _newlatitude;
        tags[_tagId].longitude = _newlongitude;
        _transferToken(tagToOwner[_tagId],msg.sender,10); // タグの持ち主から発見者へトークン報酬を与える

     }
    
    // 所有するタグ情報を取得する
    // getter関数(view)はgasを利用しない
    // タグの配列に関数呼出し時でのみデータ保持する{memory変数}を用いることでgasを節約
    function getTagsByOwner(address _owner) external view returns(uint[] memory) {
        uint[] memory result = new uint[](ownerTagCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < tags.length; i++) {
            if (tagToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
    
    // タグIDにより、登録されているタグの位置情報を取得する
    function getTagsById(uint _tagId) public view returns(uint, uint){ 
         return (tags[_tagId].latitude,tags[_tagId].longitude);  // タグIDと整合性を保つため、 _tagIdから-1している
     }
    
}
