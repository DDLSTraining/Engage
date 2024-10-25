
## Brief Notes -- AI Practitioner Exam AIF-C01

- **Artificial intelligence**, solving cognitive problems commonly
associated with human intelligence, such as learning, creation, and
image recognition. The goal is to create self-learning systems that derive meaning from
data, respond meaningfully when you ask it questions.

- **Machine learning** is a branch of AI that uses data and algorithms to
imitate the way humans learn. It's the science of developing algorithms
and statistical models perform complex tasks without explicit
instructions. It improves its accuracy by learning from data. They are
trained by using large datasets to identify patterns and make
predictions.

- **Deep learning** is a type of machine learning model that is inspired
by human brains using layers of **neural networks** to process
information such as recognizing human speech, objects and images .

Using a technique called **regression analysis**, an AI model can
process historical data, also known as **time series data** and predict
future values.

**Predictions that AI makes are called inferences**. An inference is
**basically an educated guess**, so the model gives a probabilistic
result.

**Natural language processing, NLP,** is what allows machines to
understand, interpret, and generate human language in a natural-sounding
way.

- **Generative AI** can have seemingly intelligent conversations and
**generate original content** like stories, images, videos, and even
music. You typically start with a prompt. (**Amazon Bedrock**)

To train the algorithm to produce the output we expect, we give it
**known data**, which consists of **features**. You can think of
features as the columns in a table, or the pixels in an image.

We continue to train the algorithm by giving it more known data to
analyze. Its task is to find the correlation between the input data
features and the known expected output, if available.

Adjustments are made to the model by changing internal parameter values
until the model reliably produces the expected output.

A trained model is then able to make accurate predictions and produce
output from new data that it hasn\'t seen during training. This is known
as **inference**.

---
ML models can be trained on different types of data from various
sources.

- **Structured data**, where data is stored as rows in a table with
columns or text files like CSV, or RDS, or Redshift and can be exported
into Amazon S3.

- **Semi-structured**, here **data elements can have different attributes
or missing attributes**. An examples: text file that contains JSON.
DynamoDB and Amazon DocumentDB with MongoDB compatibility, are two
databases built specifically for semi-structured data.

- **Unstructured** data is data that doesn\'t conform to any specific data
model, such as; images, video, and text files, or social media posts,
typically stored as objects in S3. The features for ML are derived from
the objects by using processing techniques like **tokenization**,
**which breaks down text into individual units of words or phrases.**

- **Time series data** is important for training models that need to
predict future trends. Each data record is labeled with a **timestamp,
and stored sequentially**. Examples include the used memory, CPU
percentage, and transactions per second.

**The training process produces model artifacts,** **which typically
consists of trained parameters, a model definition that describes how to
compute inferences and other metadata.** The **model artifacts**,
normally stored in Amazon S3, are packaged together with inference code
to make a deployable model.

**Inference code** is the software that implements the model, by reading
the **artifacts**.

There are two general options for hosting a model.

- Firstly **where an endpoint is always available to accept inference
requests in real time.** **Real-time inference** is ideal for online
inferences that have low latency and high throughput requirements.

- Secondly is where a **batch job** is performing inference. Batch is
suitable for offline processing when large amounts of data are available
upfront, and you don\'t need a persistent endpoint.

**Supervised learning** here you train your model with data that is
**pre-labeled**. For example, pictures of fish labeled as fish, then
include pictures of other animals like manatees labelled as not fish.
Our training data specifies both, the input and the desired output of
the algorithm. For an image classification problem like this, the model
will be looking at the pixels of the image and recognizing clusters and
patterns. The internal parameters of the algorithm are adjusted during
the training process. It continues until the model is successfully
identifying as fish, the images that are labeled as fish, and
identifying others as non-fish.

**Amazon offers a labeling service, Amazon SageMaker Ground Truth,**
which leverages crowdsourcing service called Amazon Mechanical Turk that
provides access to a large pool of affordable labor spread across the
globe.

**Unsupervised** **learning algorithms train on data that has features
but is not labeled**. They can **spot patterns**, **group the data into
clusters**, and split the data into a certain number of groups.
Unsupervised learning is useful for use cases such as pattern
recognition, anomaly detection, and automatically grouping data into
categories. As the **training data does not require labeling**, setup is
straightforward. These algorithms can also be used to clean and process
data for further modeling automatically. An example of clustering is
identifying different types of network traffic to predict potential
security incidents. Because unsupervised learning can detect
abnormalities, it is commonly used for anomaly detection.

---
**SageMaker Tools & Services: (to custom build your AI Models)**

1\. **Sagemaker Studio:** A web-based, interactive development
environment for ML that allows you to build, train, deploy, and manage
ML models.

2\. **Sagemaker Autopilot:** Automates the machine learning ML process
by automatically exploring different algorithms and hyperparameters to
find the best model for your data.

3\. **Sagemaker Data Wrangler: To** clean, transform, and enrich your
data for ML.

4\. **Sagemaker Training Jobs:** To train ML models on large datasets.

5\. **Sagemaker Inference:** Deploy ML models to production for
real-time inference.

6\. **Sagemaker Pipelines:** Build and manage ML workflows.

7\. **Sagemaker Model Registry:** Track and manage your ML models.
Publish your own

8\. **Sagemaker Notebooks:** Create and run Jupyter Notebooks for ML
development.

9\. **Sagemaker Notebook Instances:** Create and manage Amazon EC2
instances for running Jupyter Notebooks.

10\. **Sagemaker Notebook Security**: Secure your Jupyter Notebooks with
encryption and access control.

11\. **Sagemaker Experiments:** Track and manage your ML experiments.

12\. **Sagemaker Debugger:** Debug and optimize your ML models.

13\. **Sagemaker Clarify:** Explain and interpret your ML models.

14\. **Sagemaker Ground Truth:** Create and manage human labeling
workflows for training ML models.

15\. **Sagemaker Model Monitor:** Monitor your ML models in production
for drift and performance issues.

16\. **Sagemaker Model Deployment**: Deploy ML models to production for
real-time inference.

17\. **SageMaker Edge Manager:** Deploy ML models to edge devices for
real-time inference.

18\. **Amazon SageMaker Feature Store**: Fully managed, purpose-built
repository to store, share, and manage features for machine learning
(ML) models.

19\. **SageMaker JumpStart**: Hundreds of built-in algorithms with
pretrained models from model hubs, including TensorFlow Hub, PyTorch
Hub, Hugging Face, and MxNet GluonCV.

20\. **SageMaker Model Card** to document critical details about your
machine learning (ML) models for governance and reporting.

21 **SageMaker Canvas** to create ML solutions without the need to write
code

## Other Services for AI in AWS
**Amazon Comprehend** for text processing -- pre-process large scale
text data for a NLP model (not summarize)

**AWS ParallelCluster** -- storage foe Deep Learning models

**AWS Deeplens** is a deep learning-enabled video camera that is
developed by Amazon Web Services (AWS). It is designed to make it easy
for developers to create and deploy deep learning models on edge
devices, such as cameras and robots.

**Amazon Transcribe:** Speech recognition service with speech to text
capabilities.

**Amazon Lex -** is a fully managed service for building conversational
interfaces into any application using voice and text.

**Amazon Polly -** Converts text into lifelike speech

**Amazon Textract** -- extract text from scanned docs

**Amazon Translate** -- between languages

**Amazon Personalize** - Uses your data to generate item recommendations for
your users. 

**Amazon Comprehend** - uses a pre-trained model to examine and analyze
a document or set of documents to gather insights about it.

**Amazon QuickSight** - BI

**Amazon Kendra** - Intelligent search service that uses natural
language processing and advanced machine learning algorithms to return
specific answers to search questions from your data.

**AWS Data Exchange** -- find, subscribe and use 3^rd^ party data

**Amazon Bedrock Knowledge Bases** is a fully managed capability that
helps you implement the entire RAG workflow from ingestion to retrieval
and prompt .

**Amazon Rekognition --** deep learning image and video analysis service

**Amazon Bedrock,** you will be charged for model inference and
customization. You have a choice of **two pricing plans for inference:**

> **1. On-Demand and Batch:** This mode allows you to use FMs on a
> pay-as-you-go basis without having to make any time-based term
> commitments.
>
> **2. Provisioned Throughput:** This mode allows you to provision
> sufficient throughput to meet your application\'s performance
> requirements in exchange for a time-based term commitment.

Price per 1,000 input tokens & Price per 1,000 output tokens, price per
image

**Provisioned Throughput pricing:** Price per hour per model with no
commitment or 1-month or 6-month commitment

**Parameters:**

> **Temperature :**  higher values indicating more randomness
>
> **Top_P**, also known as nucleus sampling, controls the diversity of
> the generated text by only considering tokens with the highest
> probability mass. Top_P = 0.1: Only tokens within the top 10%
> probability. Top_P = 0.9: 90%
>
> **Top K** sampling only considers the top K most probable tokens. For
> instance, if K = 50, only the 50 most probable tokens are considered

**AWS Bedrock Agents:** Orchestrate interactions between foundation
models (FMs), data sources, software applications, and user
conversations. In addition, agents automatically call APIs to take
actions and invoke knowledge bases to supplement information for these
actions. Developers can save weeks of development effort by integrating
agents to accelerate the delivery of generative AI apps .

The end-to-end ML process includes the following phases:

> **Business goal identification** -- also determining success metrics,
> KPI & compliance issues
>
> **ML problem framing**
>
> **Data collection:** **AWS Glue Data Catalog**
>
> **Data integration and preparation:**
>
> - **Amazon SageMaker Ground Truth**, which can be used for data labeling
>
> - **SageMaker Data Wrangler**, which simplifies the process of data
> preparation and feature engineering
>
> - **SageMaker Feature Store**, which enables you to store, update,
> retrieve, and share ML features
>
> **Feature engineering:** selection and transformation of data
> attributes or variables during the development of a predictive model.
> **Amazon SageMaker Data Wrangler**
>
> >  **Model training**
>
> > **Model validation**
>
> >  **Business evaluation**
>
> > **Production deployment** (model deployment and model inference)

**Metrics**

> **ROUGE -** or Recall-Oriented Understudy for Gisting Evaluation, is a
> set of metrics and a software package used for **evaluating automatic
> summarization and machine translation software in natural language
> processing. E.g. Text summarization**
>
> **BLEU Score:** is basically a measure of how many words in the
> machine-generated text appearing in the reference human-generated
> text. The basic idea is to evaluate precision by calculating the count
> of n-grams (combination of n words), in the generated text appearing
> in the reference. BELU primarily uses precision, but it also adds a
> brevity penalty term inorder to avoid the overly short outputs, that
> are favoring.
>
> **R-squared metric** --- R², or the coefficient of determination --
> is used to measure how well a model fits data, and how well it can
> predict future outcomes. 
>
> **Accuracy** is a metric that measures how often a machine learning
> model correctly predicts the outcome. You can calculate accuracy by
> dividing the number of correct predictions by the total number of
> predictions
>
> **Root mean square error** or **root mean square deviation** is one of
> the most commonly used measures for evaluating the quality of
> predictions. **not for LLM**
>
> **Learning rate** refers to the strength by which newly acquired
> information overrides old information.
>
> **Average Response Time --** runtime efficiency
>
> **Confusion Matrix -** Assess classification model performance in
> machine learning by comparing predicted values against actual values
> for a dataset.
>
> **Correlation Matrix -** Used to evaluate the relationship between two
> variables in a data set
>
> **R2 score -** Used to evaluate the performance of a regression-based
> machine learning model.
>
> **Mean squared error (MSE) -** measures the average squared difference
> between the predicted and the actual target values within a dataset.
>
> **BERTScore --** quality of text. Semantic similarity between chatbot
> and human responses
>
> **Perplexity** - probability of a given sequence of words
>
> **Area under the ROX Curve (AUC)** -- to quantify errors in
> classification tasks true positive rate against false positive rate
> (**not for LLMs**)
>
> **F1 score** -- measure errors in classification task with precision and
recall (**not for LLMs**)

**Semantic robustness** -- for LLM outputs change as a result of small
semantic-preserving adjustments in the input

**SageMaker Endpoints:** You can deploy your model to SageMaker hosting
services and get an endpoint that can be used for inference. These
endpoints are fully managed and support autoscaling

**Embeddings** are numerical representations of real-world objects that
machine learning (ML) and artificial intelligence (AI) systems use to
understand complex knowledge domains like humans do.

A **token** is essentially a component of a larger data set, which may
represent words, characters, or phrases.

**Hyperparameters** affect the model's performance and are set before
training. **Hyperparameter tuning**

**ML algorithms**

> **Decision tree** is a supervised learning algorithm used for
> classification and predictive modelling.
>
> **Linear regression** algorithm is a supervised algorithm used to
> predict continuous numerical values that fluctuate or change over time
>
> **Logistic regression**, is a supervised learning algorithm used for
> binary classification
>
> **Neural networks**

An **epoch** in machine learning means one complete pass of the training
dataset through the algorithm.

**AI Risks**

> **Exposure:** Sensitive information accidentally included in Prompts
>
> **Poisoning:** Malicious actors intro data in training sets (bias or
> false)
>
> **Hijacking:** manipulates prompts -- e.g. How to hack into...
>
> **Jailbreaking:** ignore safety constraints act outside ethical
> boundaries
>
> **Extract the prompt template: attacker** forces the LLM to print
> instructions that it receives from the frontend App, uncovering
> vulnerabilities
>
> **Ignore Prompt template**: forces the LLM to use a different set of
> instructions
>
> **Prompted persona switching:** forces the LLM to change its comms
> style
>
> **Extract conversation History:** forces LLM to share sensitive
> details (steal user identities)
>
> **Prompt Template** - Contains the template for the prompt that\'s
> sent to the model for response generation.

**Mitigation**

1, Sanitize your inputs

2, Validate data for training sets

3, Strict input validation to prevent Hijacking

4, Employ robust safety measures and continuous monitoring

**Model Training:**

**Pre-training --** learns for massive data set

**Continuous pre-training** uses unlabeled data to adapt FM (extra
reading material) can help the model understand industry-specific
terminology.

**Fine tuning** -- labelled data to train for specific tasks input
output pairs (practice tests with answers)

**Fine Tuning options / methods**

- **Instruction tuning** -- data set of instructions and corresponding
outputs (**labelled**) Prompt-response pairs

- **Continuous Pre-Training** -- **unlabeled** data or specific topics

- **Transfer Learning** -- extend with additional knowledge

- **Domain adaptation fine-tuning -** Adapting Models for specific domains

- **RAG --** add extra data (cost)

- **Prompt engineering**

**Underfitting -** Does not identify the relationships in training data,
leads to low accuracy on both training and testing data.

**Overfitting --** Unable to perform well when given new data. High
accuracy on training data but low accuracy on testing data. **Low bias,
High variance** Low bias indicates that the model is not making
erroneous assumptions about the training data. High variance indicates
that the model is paying attention to noise in the training data and is
overfitting**.**

**Feature engineering** -- increase no of variables in training dataset
to improve model performance

The **context window** is a model property that describes the number of
tokens that the model can accept in the context. 

**Embeddings** are vector representations of content that captures
semantic relationships. They provide content with similar meanings to
have close vector representations and give the model the ability to
understand and generate coherent and meaningful text.

You can use **RDS for PostgreSQL** to store embedding vectors for
real-time transactions.

The **Generative AI Security Scoping Matrix is** a framework that you
can use to classify generative AI use cases.
