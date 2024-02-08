# cron-runner
cronでdocker run実行できるよう、doodのimageとしている。

```
$ mkdir crontabs
$ vim crontabs/root
```

でrootのcrontabを作成の上、
`docker compose up -d --build`を実行。
