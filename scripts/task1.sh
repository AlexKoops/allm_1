# make the script work relative to the place it is called
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR/../nanochat"

# download data
uv run -m nanochat.dataset -n 2

# Run 1:

# create first tokenizer with vocab-size of 32768
uv run -m scripts.tok_train --max-chars=500000000 --vocab-size=32768
uv run -m scripts.tok_eval

# Run 2:

# create second tokenizer with vocab-size of 8192
uv run -m scripts.tok_train --max-chars=500000000 --vocab-size=8192
uv run -m scripts.tok_eval
