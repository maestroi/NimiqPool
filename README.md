# Nimiq Mining-Pool Server

# WIP

This mining pool server combines resources of multiple clients mining on the Nimiq blockchain.
Clients are independent network nodes and generate or validate blocks themselves to support decentralization.
Details about the mining pool protocol can be found [here](https://nimiq-network.github.io/developer-reference/chapters/pool-protocol.html#mining-pool-protocol).
A mining pool client is implemented in [Nimiq Core](https://github.com/nimiq-network/core/tree/master/src/main/generic/miner).
Created with love by Nimiq, and DockerPool with acemining.

This pool uses al

## WARNING
By Running a miningpool you are handeling nimiq currency for your users please handle with care!

## Generating wallet.
For payout you can get a wallet with seed here https://tools.sushipool.com/.
Use at your own risk!

## Requirements
- VPS/Dedicated server with own public IP
- Ubuntu 20.04+
- Domain name
- Cloudflare account
- Some IT knowledge
- Coffee.(Critical)

## TESTED ON
- Hetzner cloud.
- Cloudflare dns only domain.
- Ubuntu 20.04 x64 server.

## First run
steps:
- First of all setup cloudflare by following this guide https://support.cloudflare.com/hc/en-us/articles/201720164-Step-2-Create-a-Cloudflare-account-and-add-a-website
- Have fun :)
  
## Run
- curl -sSL https://raw.githubusercontent.com/maestroi/NimiqPool/master/run.sh | sudo bash
- Run `sudo docker-compose up -d`, this is done in /home/USER/node directory of the created user.
- Run `sudo docker-compose logs --follow` to see logging.
- In a browser open https://YOURDOMAIN.COM:8444 to see the pool page!

## LIMITED SUPPORT.
there is limited support on this project, i will keep it up to date if i feel like it :-).

Donations on: NQ87 T9QB 9RR6 5A4F EV3U 320T 2XK9 QGYS 2MJA are appreciated. 

# Changes:
Added:
- origin/soeren/pool-stats 
- origin/soeren/owner-payout
- origin/fiaxh/optimize_db_qrys
- origin/soeren/proxied-ip
