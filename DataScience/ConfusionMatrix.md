# Confusion Matrix and Model Performance Metrics

## Confusion Matrix

A confusion matrix is a table used to describe the performance of a classification model on a set of test data for which the true values are known (supervised learning).

Matrix Definitions:

* TP: True Positives - Predicted the result to be true and it was true.
* TN: True Negatives - Predicted the result to be false and it was false.
* FP: False Positives - Predicted the result to be true and it was false.
* FN: False Negatives - Predicted the result to be false and it was true.

|n = 140| Actual:<br/>True | Actual:<br/>False | Row Total |
|-|-|-|-|
| Predicted:<br/>True | TP: 65 | FP: 10 | 75 |
| Predicted:<br/> False | FN: 30 | TN: 35 | 65 |
| Column Total | 95 | 45 | |

* Accurace: 0.64
* Error Rate: 0.29
* Percision: 0.87
* Recall: 0.68
* F1 Score:
* AUC: 

## Accuracy

How often is the classifer correct?

```
Accuracy = (TP + TN) / Total

For the above example: ( 65 + 35 ) / 140 = 0.68
```
## Error Rate

How often is the classifier incorrect?

```
Error Rate = (FP + FN) / Total

For the above example: (10 + 30) / 140 = 0.29
```

## Precision

When the classifier predicts true, how often is it correct?

```
Precision = TP / Total Predicted True

For the above example: 65 / 75 = 0.87
```

## Recall

When the result actually is true, how often does it predict true? 

Also called _True Positive Rate_ or _Sensitivity_.

```
Recall = TP / Actual True

For the above example: 65 / 95 = 0.68
```

## F1 Score

## AUC



