# Vibora

Vibora is fully asynchronous because web APIs are often IO based and that's exactly where an async architecture shines.

Vibora also take advantage of multiple CPU cores by default thanks to the multi-processed architecture. Uvloop and other C speed-ups are used when available.

# Links

- https://vibora.io/
- https://github.com/vibora-io/vibora
- https://docs.vibora.io/routing

# Running

```sh
docker-compose up
```

# Problemns on Windows

- https://github.com/vibora-io/vibora/issues/38
- https://github.com/vibora-io/vibora/issues/183