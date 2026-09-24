export NANOCHAT_BASE_DIR="/local/$(whoami)/allm_data"
mkdir -p "$NANOCHAT_BASE_DIR"
echo "NANOCHAT_BASE_DIR=$NANOCHAT_BASE_DIR"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR/../nanochat"

uv run python -m scripts.chat_sft --run="d4_remote_midtraining" --model-tag="d4_remote" --eval-every=20 --set-stage="mid" --device-batch-size=8
