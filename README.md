# snapshot-klaytn

Copy of snapshot.org source by [snapshot-labs](https://github.com/snapshot-labs).

Unlike original source, this repository contains all libraries in this monorepo.
Javascript packages are referenced using local paths.

## Components

- snapshot: Static web server
- snapshot-hub: API server for data storage backed by MySQL and IPFS
- snapshot-score: API server for on-chain data backed by JSON RPC

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
    docker-compose build
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

