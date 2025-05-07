# UNIBUC-SD-at-BioNLP-ArchEHR-QA-2025

# Useful Links

* [ArchEHR-QA 2025 Task](https://archehr-qa.github.io/)
* [PhysioNet Dataset](https://physionet.org/content/archehr-qa-bionlp-task-2025/1.2/)
* [Codabench Competition](https://www.codabench.org/competitions/5302)

# How to run


## Step 01 (Inference Server)
We use quantizied models with the GGUF format, directly on a `llama.cpp` local server. You can replace this step with any OpenAI API like compatible server.

* Open the `/test-process/llama-server.sh` file.
* Change the `MODEL_PATH` variable to reflect the location of your gguf model file.
* Change `LLAMA_CPP_DIR` variable to the location of your llama.cpp instalation.
* Start the server via `./test-process/llama-server.sh`.

## Step 02 (Convert the xml data)

We convert the xml data to JSON by running the cells inside the `0-convert-xml/extract_data.ipynb` file.

Remember to properly adjust the correct path to the `test/archehr-qa.xml` file, after you downloaded the data.

## Step 1 (Prediction)

Run all the files inside the `1-predict` directory (sequentially or in parallel). Remember to boot up the inference servers for each model.

The predictions will be generated in the `test-process` directory.

## Step 2 (Merging)

For ensembling the predictions, we run the `concat-predictions.ipynb` and `majority-vote-predictions.ipynb` files, in that order, from the `2-merge` directory.

Two new files will be generated inside the `2-merge` directory, but we are interested only in the `merged_predictions.json` one going forward.

## Step 3 (Summarization)

Run the file inside `3-summarization` directory, which will generate a submission.json file.

## Step 4 (Postprocessing)

We further postprocess the output by running the file inside the `4-postprocessing` directory. To be noted that not all the postprocessing is inside here. Some is done directly after the model gives a response inside the summarization step.