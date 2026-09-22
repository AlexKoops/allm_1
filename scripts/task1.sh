# run from the allm_1/nanochat folder with this command: ./../scripts/task1.sh, when I tried this from allm_1 I got module errors

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
