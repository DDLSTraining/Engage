# AWS IAM Policies - Summary

**Identity-based policies:-** are JSON documents that control what actions an identity (users, groups of users, and roles) can perform, on which resources, and under what conditions.  **Identity-based policies** can be further categorized:

* .**Managed policies** – Are standalone policies that you attach to multiple users, groups and roles.

   There are two types of managed policies:
* . **AWS managed policies** – Created and managed by AWS.
* . **Customer managed policies** –created and managed by you & provide a more precise control

**Inline policies** – Are added directly to a single user, group, or role. They maintain a strict one-to-one relationship between a policy and an identity. They are deleted when you delete the identity.

**Resource-based policies** - are attached to a resource such as an Amazon S3 bucket. These policies grant the specified principal permission to perform specific actions on that resource and defines under what conditions this applies. Resource-based policies are inline policies. There are no managed resource-based policies.

# Evaluating identity-based policies with resource-based policies!

**Identity-based policies** and **resource-based policies** grant permissions to the identities or resources to which they are attached. 

When an IAM entity (user or role) requests access to a resource within the same account, AWS evaluates all the permissions granted by the identity-based and resource-based policies. 
The resulting permissions are the total permissions of the two types. If an action is allowed by an identity-based policy, a resource-based policy, or both, then AWS allows the action. 
But an explicit deny in either of these policies overrides the allow.

# Choosing between managed policies & inline policies

In most cases, we recommend that you use Managed policies instead of Inline policies as Managed policies provide the following features:
Reusability - A single managed policy can be attached to multiple principal entities (users, groups, and roles).  You can create a library of policies that define permissions that are useful for your AWS account, and then attach these policies to principal entities as needed.
Central change management - When you change a managed policy, the change is applied to all principal entities that the policy is attached to. In contrast, to change an inline policy you must individually edit each identity that contains the policy. 
Versioning and rolling back - When you change a customer managed policy, IAM creates a new version of the managed policy and stores up to 5 versions which you can revert back to.
Delegating permissions management -  You can designate some users as full administrators - that is, administrators that can create, update, and delete policies. You can then designate other users as limited administrators that can attach policies to other principal entities, but only the policies that you have allowed them to attach.
Automatic updates for AWS managed policies - AWS maintains AWS managed policies and updates them when necessary.  The updates are automatically applied to the principal entities that you have attached the AWS managed policy to.

# Choosing between managed policies & inline policies

Using Inline policies
Inline policies are useful if you want to maintain a strict one-to-one relationship between a policy and the identity that it's applied to. 
For example, you want to be sure that the permissions in a policy are not inadvertently assigned to an identity other than the one they're intended for. 
When you use an inline policy, the permissions in the policy cannot be inadvertently attached to the wrong identity. 
In addition, when you use the AWS Management Console to delete that identity, the policies embedded in the identity are deleted as well. That's because they are part of the principal entity.


