export NANOCHAT_BASE_DIR="/local/$(whoami)/allm_data"
mkdir -p "$NANOCHAT_BASE_DIR"
echo "NANOCHAT_BASE_DIR=$NANOCHAT_BASE_DIR"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR/../nanochat"

# Eval base checkpoint model:
uv run python -m scripts.chat_eval -i base --model-tag="d4_remote"

# Eval mid-training checkpoint model:
uv run python -m scripts.chat_eval -i mid --model-tag="d4_remote"

# Eval sft checkpoint model:
uv run python -m scripts.chat_eval -i sft --model-tag="d4_remote"
