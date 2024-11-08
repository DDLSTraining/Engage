
**Security Engineering on AWS**  
**Day 2 Review**  
**Introduction**  
Focus of day 2:
- AWS Key Management Service (AWS KMS)  
- AWS Secrets Manager  
- Amazon Macie  
- AWS Network Firewall  
- AWS WAF  
- AWS Shield  

**Mod 4 - Managing Keys and Secrets on AWS**  
- The challenge of key management

**AWS KMS Advantages:**  
- Create KMS keys with a unique alias and description, Rotate KMS keys automatically, Deactivate or delete keys, Audit through CloudTrail & Import keys  

**Key Types:**  
- **Symmetric Keys** - Encryption  
- **Asymmetric Keys** – Public, Private key pair  
- **HMAC Keys** - Hash-based Message Authentication Code – to validate Integrity  

**Multi Region Keys**  

**Cloud HSM** – Dedicated hardware in your VPC, can cluster  
**FIPS 140-2 Level 3** (Federal Information Processing Standard certified) HSMs are designed to prevent physical tampering with tamper-evident seals, intrusion sensors, and self-destruct mechanisms.  
Protecting data in transit – TLS session and X.509 Certificates  

**AWS Certificate Manager** – Private CA  

**AWS Secrets Manager** - Safe, Auditable, Rotate Secrets & Access control

**Lab3 - Using KMS to Encrypt Secrets in Secrets Manager**

**Mod 5 – Data Security**
Data Protection  
**S3** – Encryption at rest, block access, Object Lock, Versioning, Access Points  
Macie – Sensitive data (PII) – Classify and Protect  
**SSE-S3, SSE-C & SSE-KMS**  
**RDS** – Data protection in Transit and at Rest, Network Isolation (SG), Replication  
**DynamoDB** - Data protection in Transit and at Rest, Fine-grained access control, Replication  
**EBS** – Encryption, Volume Data deletion  
**S3 Glacier** – Vault Lock  

**Lab 4 - Data Security in Amazon S3**

**Mod 6 - Infrastructure and Edge Protection**
Security in VPC’s
- Network Access Control List (NACL) 
- Security Group

**AWS Network Firewall** (at the VPC)  
**VPC Peering** – Non-Transitive   
**VPC Endpoints** – Interface & Gateway   
**ELB** – Application Load Balancer, Network Load Balancer, Gateway Load Balancer & Classic  
**CloudFront** – CDN  
**Route 53** - DNS  
**AWS Web Application Firewall** – WAF  
Firewall Manager  
**Shield** – Standard and Advanced  

**Lab 5** – (probably tomorrow) **Using AWS WAF to Mitigate Malicious Traffic**
