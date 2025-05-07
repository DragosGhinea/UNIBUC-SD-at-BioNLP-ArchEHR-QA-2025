#!/bin/bash

MODEL_PATH="$HOME/nlp/models/gemma/gemma-3-27b-it-Q6_K.gguf"
# MODEL_PATH="$HOME/nlp/models/mistral/Mistral-Small-3.1-24B-Instruct-2503-Q8_0.gguf"


HOST_IP="localhost"
PORT="8888"
GPU_LAYERS="999"
CPU_THREADS="4"
TIMEOUT="600"

LLAMA_CPP_DIR="$HOME/nlp/llama.cpp/build/bin"
cd "$LLAMA_CPP_DIR" || exit 1 # Use || exit 1 to stop if cd fails

echo "Starting llama.cpp server..."
echo "Model: $MODEL_PATH"
echo "GPU Layers: $GPU_LAYERS"
echo "CPU Threads: $CPU_THREADS"


./llama-server \
    -m "$MODEL_PATH" \
    --alias "loaded-model" \
    --host "$HOST_IP" \
    --port "$PORT" \
    -ngl "$GPU_LAYERS" \
    -t "$CPU_THREADS" \
    -cb \
    --seed 3407 \
    --timeout "$TIMEOUT" \
    --repeat-penalty 1.0 \
    --min-p 0.0 \
    --top-k 64 \
    --top-p 0.95

echo "llama.cpp server process exited."