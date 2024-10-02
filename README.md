# tttm-randy

[tttm-randy] is a simple player server for the [tttm] tic-tac-toe challenge.

The server uses [Python](https://www.python.org), [Flask](https://flask.palletsprojects.com/), [Gunicorn](https://gunicorn.org/) and random strategy.

`tttm-randy` is available at [http://tttm-randy.ogrodje.si (example move)](http://tttm-randy.ogrodje.si/move?gid=b3409c8d-8002-45f0-9021-f5f267bc574e&moves=X-1-1_O-0-0&playing=X).

## Docker

```bash
docker pull ghcr.io/otobrglez/tttm-randy:latest
docker run -p 5001:5000 ghcr.io/otobrglez/tttm-randy:latest
```

\- [Oto Brglez](https://github.com/otobrglez)

[tttm]: https://github.com/ogrodje/tttm
[tttm-randy]: https://github.com/otobrglez/tttm-randy
