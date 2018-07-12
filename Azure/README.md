# Azure Course Notes

Notes and resources for the following Microsoft Azure official courses:

* [20533 - Implementing Microsoft Azure Infrastructure Solutions](https://www.microsoft.com/en-au/learning/course.aspx?cid=20533)
* [10979 - Microsoft Azure Fundamentals](https://www.microsoft.com/en-au/learning/course.aspx?cid=10979)

## Table of Contents 📄

* [Setup](/Azure/Setup.md)
* [Resources](/Azure/Resources.md)
* [Containers](/Azure/Containers.md)

## Lab Notes 🔬

* [10979 GitHub Repository](https://github.com/MicrosoftLearning/10979-MicrosoftAzureFundamentals)
* [20533 GitHub Repository](https://github.com/MicrosoftLearning/20533-ImplementingMicrosoftAzureInfrastructureSolutions)
* Use `East US` region for all labs.
* Use one of the following virtual machine sizes if prompted:
  * `Standard_D1_v2` - 1 Processor, 4GB RAM (Cheap)
  * `Standard_D2_v2` - 2 Processors, 8GB RAM (Better Performance)

### 20533 Module 7 Lab B Excersize 1

If an error occurs when using the `az aks create` command related to `<VM size>`, try one of the following sizes:

* `Standard_D2_v2`
* `Standard_D2_v3`
* `Standard_D1`
* `Standard_D4_v2`

_Note: Virtual machine size names are case sensitive._

