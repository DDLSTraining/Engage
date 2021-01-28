# Workstation Setup

You can use your desktop or laptop to complete the labs. The below steps give you a good starting point, however it is highly likely you will need to work around issues as you go. Expect many issues.

For reference:

* [Configure a development environment for Azure Machine Learning](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-configure-environment)
* [Machine Learning Server Documentation](https://docs.microsoft.com/en-us/machine-learning-server/)

## Install on Windows with Scoop

1. Install [VSCode](https://code.visualstudio.com/).
   * Install the Azure Machine Learning extension.

2. Open `PowerShell`.

3. Install [scoop](https://scoop.sh/) using the commands below:

```powershell
iwr -useb get.scoop.sh | iex
scoop bucket add extras
```

4. Install platform dependencies:

```powershell
scoop install azure-cli python git miniconda3
```

5. Configure the Azure CLI:

```powershell
az login
az extension add -n azure-cli-ml
```

6. Install python dependencies:

```powershell
pip install --upgrade azureml-sdk
pip install pandas matplotlib joblib sklearn azureml.widgets
```

7. Clone the GitHub DP100 repository:

```powershell
cd \path\to\your\project\directory
git clone https://github.com/MicrosoftLearning/mslearn-dp100.git DP100
```

8. Get the workspace config and launch VSCode:

```powershell
cd DP100
az ml workspace list --query '[?workspaceName==`YOUR_WORKSPACE_NAME`] | [0]' > config.json
code .
```

## General Installation Instructions

1. Install [VSCode](https://code.visualstudio.com/).
   * Install the Azure Machine Learning extension.

2. Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).

3. Install [Python3](https://www.python.org/downloads/).

4. Install [Miniconda](https://docs.conda.io/en/latest/miniconda.html).

5. Install [Git](https://git-scm.com/).

6. Open a command prompt and run the following commands:

```bash
az login
az extension add -n azure-cli-ml
cd /path/to/your/project/directory
# cd \path\to\your\project\directory
git clone https://github.com/MicrosoftLearning/mslearn-dp100.git DP100
cd DP100
az ml workspace list --query '[?workspaceName==`YOUR_WORKSPACE_NAME`] | [0]' > config.json
pip install --upgrade azureml-sdk
pip install pandas matplotlib joblib sklearn azureml.widgets
```

## Notes

* File paths may need forward slashes changed to double back slashes. Eg ` /  =>  \\ `.
* The `compute_target` may need to be changed from "local" to "NAME_OF_YOUR_INSTANCE".
* Windows installations may have issues with some python package installations (automl as an example).
