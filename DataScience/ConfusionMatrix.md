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
* F1 Score: 0.76
* AUC: _Not Calculated_

## Accuracy

How often is the classifer correct?

```
Accuracy = (TP + TN) / Total

Example: ( 65 + 35 ) / 140 = 0.68
```
## Error Rate

How often is the classifier incorrect?

```
Error Rate = (FP + FN) / Total

Example: (10 + 30) / 140 = 0.29
```

## Precision

When the classifier predicts true, how often is it correct?

```
Precision = TP / Total Predicted True

Example: 65 / 75 = 0.87
```

## Recall

When the result actually is true, how often does it predict true? 

Also called _True Positive Rate_ or _Sensitivity_.

```
Recall = TP / Actual True

Example: 65 / 95 = 0.68
```

## F1 Score

The F1 score is the harmonic mean of the precision and recall, where an F1 score reaches its best value at 1 (perfect precision and recall). - [Wikipedia](https://en.wikipedia.org/wiki/F1_score)

```
F1 score = 2 * ( (Precision * Recall) / (Precision + Recall) )

Example:
Precision * Recall = 0.59
Percision + Recall = 1.55
2 * ( 0.59 / 1.55 ) = 0.76
```

## AUC

Area Under the Receiver Operating Characteristic Curve

ROC: A receiver operating characteristic curve, or ROC curve, is a graphical plot that illustrates the diagnostic ability of a binary classifier system as its discrimination threshold is varied. - [Wikipedia](https://en.wikipedia.org/wiki/Receiver_operating_characteristic)

AUC: Area Under ROC curve - [Wikipedia](https://en.wikipedia.org/wiki/Receiver_operating_characteristic#Area_under_the_curve)

ROC AUC varies between 0 and 1 where 0 is the worst performance and 1 is the worst performance.

AUC has not calculated for the above example.





