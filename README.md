# tg-send - Simple File send to TelegramChat with Bot
## Informtion
This container checks every 5 minutes if a file has been updated and sends it to you via Telegram.
## Preparation
### Create Bot
write to  the BotFather via [https://t.me/BotFather](https://t.me/BotFather)

Get the HTTP-API-Key and note it somewhere

Click on the Link provided by BotFather to open a Telegram-Chat with your newly created Bot. (Click start)

### Get Envs

You need to get these environment variables:

| ENV      | Value               | Need     |
| -------- | ------------------- | -------- |
| AUTHUSER | basic-auth username | optional |
| AUTHPASS | basic-auth password | optional |
| URL      | the URL of the file | yes      |
| KEY      | The Bot-API Key     | yes      |
| FILETYPE | Filetype e.g. pdf   | yes      |

## Usage

### Deployment

#### Docker-CLI

```bash
docker run \
	-e KEY=[your key] \
	-e AUTHUSER=[http-basic-auth-user] \
	-e AUTHPASS=[http-basic-auth-password]  \
	-e URL=[your URL] \
	-e FILETYPE=[Your Filetype] \
	--name tg-send \
	--restart=unless-stopped \
	clemontx/tg-send:latest

#### 
```

#### Docker-compose

```yaml
---
verison: 3.0
services:
  tg-send:
    image: clemontx/tg-send
    container_name: tg-send
    environment:
      - KEY=<your key> 
     # - AUTHUSER=<http-basic-auth-user> --> optional
     # - AUTHPASS=<http-basic-auth-password> --> optional
      - URL=<your URL>
      - FILETYPE=<Your Filetype>
    restart: unless-stopped
```



### Start using!

If your you are using the CLI, you need to get the code to send to the Bot via:

```bash
docker logs tg-send
```

If your you are using docker-compose, you need to get the code to send to the Bot via:

```bash
docker-compose logs
```
