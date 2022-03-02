# snapshot-klaytn

Copy of snapshot.org source by [snapshot-labs](https://github.com/snapshot-labs).
Modified to support [Klaytn](https://github.com/klaytn/klaytn) network.

Unlike original source, this repository contains all libraries in this monorepo.
Javascript packages are referenced using local paths.

## Components

- Software implemented in this repository
  - **(web) [snapshot](./snapshot)**: Static web server (default port: 7000)
  - **(hub) [snapshot-hub](./snapshot-hub)**: API server for data storage backed by MySQL and IPFS (default port: 7001)
  - **(score) [snapshot-score](./snapshot-score)**: API server for on-chain data backed by JSON RPC (default port: 7002)
- Off the shelf servers
  - **db**: MySQL database storing website data.
- External services
  - **Fleek or Pinata**: IPFS hosting services storing user-signed messages.
  - **Blockchain RPC servers**: Public JSON-RPC endpoints

## How to run

1. Copy `conf/hub.env.example` to `conf/hub.env` and set values
  - `DATABASE_URL`: MySQL connection string
  - `RELAYER_PK`: Use any private key
  - `FLEEK*` or `PINATA*`: Sign up one of two IPFS hosting services
  - `PINNING_SERVICE`: Set to "fleek" or "pinata"
2. Copy `conf/web.env.example` to `conf/web.env` and set values
  - `VITE_HUB_URL`: **External** URL of hub server
  - `VITE_RELAYER_URL`: **External** URL of hub server
  - `VITE_SCORES_URL`: **External** URL of score server
  - These URLs are meant to be accessed from browser.
    You must use publicly accessible IPs or domains.
3. Build images (everytime you change any conf)
    ```
    ./build.sh
    ```
4. Start server
    ```
    docker-compose up -d
    ```
5. Setup database scheam (only once)
    ```
    sh init_schema.sh
    docker-compose restart
    ```
6. View logs
    ```
    docker-compose logs -f
    ```
7. Access webpage at http://localhost:7000

## Fixes to run in dev environment

- For testing purpose, bypass ENS (Ethereum Name Service) check by directly inserting space settings to MySQL.
This is not a problem of Klaytn; as [snapshot requires](https://docs.snapshot.org/spaces/before-creating-your-space) "an ENS domain on Ethereum mainnet even if you want to use Ethereum testnet or any other networks (Binance Smart Chain, xDAI... etc)."

- Allow snapshot-hub to take environment variable for scores server URL 

## Changes for Klaytn

- All changes: https://github.com/blukat29/snapshot-klaytn/compare/vanilla...master

- Register Klaytn RPC endpoints to [networks.json](./snapshot.js/src/networks.json)

- Deploy [multicall](https://github.com/makerdao/multicall/blob/master/src/Multicall.sol) contract as per [snapshot docs](https://docs.snapshot.org/networks)

- Modify block explorer url from `/address/0xabcd..` to `/account/0xabcd..` for compatibility with https://scope.klaytn.com.

- Restrict snapshot block (vote starting block) to be multiple of 128.
  Because the voting power is calculated at the snapshot block, the block state must be available from RPC.
