# cron-runner
cronでdocker run実行できるよう、doodのimageとしている。

```
$ mkdir crontabs
$ vim crontabs/root
```

でrootのcrontabを作成。`.env`で

```
IMAGE_REPOSITORY=nakaichomin/cron-runner
IMAGE_TAG=1.1.0
```

など設定の上、
`docker compose up -d`を実行。

`crontabs/root`のcrontab編集後の反映は`docker compose restart`.
