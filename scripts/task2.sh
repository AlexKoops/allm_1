export NANOCHAT_BASE_DIR="/local/$(whoami)/allm_data"
mkdir -p "$NANOCHAT_BASE_DIR"
echo "NANOCHAT_BASE_DIR=$NANOCHAT_BASE_DIR"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR/../nanochat"

uv run python -m scripts.base_train --depth=4 --model-tag="d4_remote" --run="d4_remote" --eval-every=20 --device-batch-size=8 --eval-tokens=20*524288
