{
  "name": "cypress-kusdt.klaytn.com",
  "skin": "indexed",
  "about": "",
  "admins": [
    "0xaB36568200B0f2B262107e4E74C68d6E8729Da39"
  ],
  "avatar": "https://avatars.githubusercontent.com/u/41137100?s=200&v=4",
  "github": "klaytn",
  "symbol": "KUSDT",
  "filters": {
    "minScore": 0,
    "onlyMembers": false
  },
  "members": [],
  "network": "8217",
  "plugins": {},
  "twitter": "klaytn",
  "strategies": [
    {
      "name": "erc20-balance-of",
      "params": {
        "address": "0xcee8faf64bb97a73bb51e115aa89c17ffa8dd167",
        "symbol": "KUSDT",
        "decimals": 6
      }
    }
  ],
  "validation": {
    "name": "basic",
    "params": {}
  }
}
