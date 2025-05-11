# Discord Utils

よりDiscordを便利に。

## 起動方法

```bash
# 環境変数
echo "DISCORD_TOKEN=Your-Discord-App-Token-Hire" > .env

# 起動
docker pull ghcr.io/kuraft/discord_utils:latest
docker run --detach　--env-file .env --restart=always ghcr.io/kuraft/discord_utils:latest
```

## 機能

### カテゴリの複製

`/clone_category [category]` 指定したカテゴリを複製する機能  
`category`に指定したカテゴリーチャンネルをチャンネル名・権限が同様のカテゴリーチャンネルを作成します。
