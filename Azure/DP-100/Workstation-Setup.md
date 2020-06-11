# Workstation Setup

1. Install [VSCode](https://code.visualstudio.com/).
   * Install the Azure Machine Learning extension.
1. Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).
2. Install [Python3](https://www.python.org/downloads/).
3. Install [Git](https://git-scm.com/).
4. Open a command prompt and run the following commands:
   * `az login`
   * `az extension add -n azure-cli-ml`
   * `cd <location you want the files stored>`
   * `git clone https://github.com/MicrosoftLearning/DP100.git`
   * `pip3 install --upgrade azureml-sdk`
   * `pip3 install pandas matplotlib azureml.widgets`
5. Download the `config.json` file from the Azure Portal.
