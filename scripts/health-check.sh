#!/usr/bin/env bash

echo "=== Проверка статуса ноды CORE ==="

echo "[1] Статус сервиса"
sudo systemctl status detalkipro-chain --no-pager | head -n 10

echo "[2] Порты 9046 (P2P) и 9047 (API)"
sudo ss -tlnp | grep -E "9046|9047"

echo "[3] API статус (локально)"
curl -s http://127.0.0.1:9047/api/v1/node/status || echo "API ещё не готов (Jetty загружается)"

echo "[4] Последние строки про блоки"
journalctl -u detalkipro-chain -n 20 --no-pager | grep -i -E "block|generate|height"
