
**Security Engineering on AWS**  
**Day 2 Review**  
**Introduction**  
**Focus of day 2:**  
- AWS Key Management Service (AWS KMS)  
- AWS Secrets Manager  
- Amazon Macie  
- AWS Network Firewall  
- AWS WAF  
- AWS Shield  

**Mod 4 - Managing Keys and Secrets on AWS**  
**The challenge of key management**  
**AWS KMS Advantages:**  
- Create KMS keys with a unique alias and description  
- Rotate KMS keys automatically  
- Deactivate or delete keys  
- Audit through CloudTrail  
- Import keys  

**Key Types:**  
- **Symmetric Keys** - Encryption  
- **Asymmetric Keys** – Public, Private key pair  
- **HMAC Keys** - Hash-based Message Authentication Code – to validate Integrity  

**Multi Region Keys**  
**Cloud HSM** – Dedicated hardware in your VPC, can cluster  
**FIPS 140-2 Level 3** (Federal Information Processing Standard certified) HSMs are designed to prevent physical tampering with tamper-evident seals, intrusion sensors, and self-destruct mechanisms.  
**Protecting data in transit** – TLS session and X.509 Certificates  
**AWS Certificate Manager** – Private CA  
**AWS Secrets Manager** – Lab 5 – (probably tomorrow) Using AWS WAF to Mitigate Malicious Traffic
