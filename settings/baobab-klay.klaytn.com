{
  "name": "baobab-klay.klaytn.com",
  "skin": "indexed",
  "about": "",
  "admins": [
    "0xaB36568200B0f2B262107e4E74C68d6E8729Da39"
  ],
  "avatar": "https://avatars.githubusercontent.com/u/41137100?s=200&v=4",
  "github": "klaytn",
  "symbol": "KLAY",
  "filters": {
    "minScore": 0,
    "onlyMembers": false
  },
  "members": [],
  "network": "1001",
  "plugins": {},
  "twitter": "klaytn",
  "strategies": [
    {
      "name": "eth-balance",
      "params": {
        "symbol": "KLAY"
      }
    }
  ],
  "validation": {
    "name": "basic",
    "params": {}
  }
}
