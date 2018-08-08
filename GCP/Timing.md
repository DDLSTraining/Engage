# Course Timing Guide

## Google Cloud Platform Fundamentals: Core Infrastructure

## Day One

|Start|End|Duration|Module|Activity|
|-----|---|--------|------|--------|
|9:00|9:15|0:15|00|Course Intro|		
|9:15|9:30|0:15|01|Introduction to GCP|
|9:30|10:00|0:30|02|Getting Started with GCP|
|10:00|10:20|0:20||Lab 2 Cloud Launcher|
|10:20|10:35|0:15||15 MINUTE BREAK|
|10:35|11:05|0:30|03|Virtual Machines in the Cloud|
|11:05|11:20|0:15||Lab 3 Compute Engine|
|11:20|12:05|0:45|04|Storage in the Cloud|
|12:05|12:50|0:45||Lab 4 Cloud Storage and Cloud SQL|
|12:50|13:35|0:45||45 MINUTE LUNCH|
|13:35|13:55|0:20|05|Containers in the Cloud|
|13:55|14:25|0:30||Lab 5 Container Engine|
|14:25|14:45|0:20|06|Applications in the Cloud|
|14:45|15:00|0:15||Lab 6 App Engine|
|15:00|15:15|0:15||15 MINUTE BREAK|
|15:15|15:30|0:15|07|Developing Deploying Monitoring in the Cloud|
|15:30|15:55|0:25||Lab 7 Deployment Manager and Stackdriver|
|15:55|16:25|0:30|08|Big Data and Machine Learning in the Cloud|
|16:25|16:40|0:15||Lab 8 BigQuery|
|16:40|17:00|0:20|09|Summary and Review|

## Architecting with Google Cloud Platform: Infrastructure

START TIME	END TIME		Total Slides	Content Slides		
		Duration			Module	Lab/Demo
DAY ONE						
|Start|End|Duration|Module|Activity|
|-----|---|--------|------|--------|
9:00	9:15	0:15	20	12	00 Course Intro	
9:15	9:25	0:10	18	12	01 Introduction to GCP Infrastructure	
9:25	9:45	0:20				01-1 Console and Cloudshell
9:45	9:55	0:10				Demo: Projects
9:55	10:10	0:15				01-2 Infrastructure Preview
10:10	10:25	0:15			15 MINUTE BREAK	
10:25	10:55	0:30	52	39	02 Virtual Networking	
10:55	11:40	0:45				02-1 Virtual Networking
11:40	12:00	0:20				02-2 Bastion Host
12:00	13:00	1:00			1 HOUR LUNCH	
13:00	14:00	1:00	60	47	03 Virtual Machines	
14:00	14:30	0:30				03-1 Creating Virtual Machines
14:30	15:15	0:45				03-2 Working with Virtual Machines
15:15	15:30	0:15			15 MINUTE BREAK	
15:30	16:10	0:40	55	44	04 Cloud IAM	
16:10	16:40	0:30				04-1 Cloud IAM
16:40	17:25	0:45	72	60	05 Data Storage Services	
END OF DAY ONE						
DAY TWO						
9:00	10:00	1:00				05-1 Cloud Storage
10:00	10:45	0:45				05-2 Cloud SQL
10:45	11:00	0:15			15 MINUTE BREAK	
11:00	11:40	0:40				05-3 Cloud Datastore
11:40	12:00	0:20	31	22	06 Resource Management	
12:00	13:00	1:00			1 HOUR LUNCH	
13:00	13:20	0:20				Demo: Billing Adminstration
13:20	14:05	0:45				06-1 Examining Billing Data with BigQuery
14:05	14:35	0:30	48	37	07 Resource Monitoring	
14:35	15:35	1:00				07-1 Resource Monitoring (Stackdriver)
15:35	15:50	0:15			15 MINUTE BREAK	
15:50	16:20	0:30				07-2 Error Reporting and Debugging (Stackdriver)
16:20	16:50	0:30	48	38	08 Interconnecting Networks	
16:50	17:50	1:00				08-1 Virtual Private Networks (VPN)
END OF DAY TWO						
DAY THREE						
9:00	9:30	0:30	58	44	09 Load Balancing	
9:30	10:45	1:15				09-1 Virtual Machine Automation and Load Balancing
10:45	11:00	0:15			15 MINUTE BREAK	
11:00	11:15	0:15	26	17	10 Autoscaling	
11:15	12:15	1:00				10-1 Autoscaling
12:15	13:15	1:00			1 HOUR LUNCH	
13:15	13:35	0:20	37	27	11 Infrastructure Automation with Cloud API	
13:35	14:45	1:10				11-1 Cloud API Infrastructure Automation
14:45	14:55	0:10	21	13	12 Infrastructure Automation with Deployment Manager	
14:55	15:35	0:40				12-1 Deployment Manager
15:35	15:50	0:15			15 MINUTE BREAK	
15:50	16:05	0:15	29	21	13 Managed Services	
16:05	16:05					No Lab
16:05	16:25	0:20	34	25	14 Application Infrastructure Services	
16:25	16:25					No Lab
16:25	16:35	0:10	16	11	15 Application Development Services	
16:35	16:35					No Lab
16:35	17:00	0:25	41	32	16 Containers	
17:00	18:00	1:00				16-1 Kubernetes Load Balancing
END OF DAY THREE						

## Architecting Google Cloud Platform: Design and Process

START	END	Based on Alpha and Beta deliveries		Minutes	Slides/Pages	MODULE	
							
DAY 1 BEGINS							
						00 Welcome	
9:00	9:25	0:25		28.35	21		Presentation
9:25	9:40	0:15		12	4		Welcome to Qwiklabs
						01 Defining the service	
9:40	10:30	0:50		48.6	36		Presentation
10:30	10:45	0:15			MORNING BREAK		
10:45	11:00	0:15		11.5	5		Introducing the photo service
11:00	12:00	1:00		60	20		Deployment Manager - beginning appserver
12:00	13:00	1:00			LUNCH		
						02 Business-logic layer design	
13:00	13:40	0:40		33.75	25		Presentation
13:40	13:55	0:15		18.4	8		The photo service is slow
13:55	14:15	0:20		17.5	7		Design Challenge #1 - Log aggregation
14:15	14:30	0:15			AFTERNOON BREAK		
14:30	15:30	1:00		60	16		Deployment Manager - package and deploy
						03 Data layer design	
15:30	16:00	0:30		31.05	23		Presentation
16:00	16:10	0:10		11.5	5		Intermittent outages
16:10	16:25	0:15		20	8		Design Challenge #2 - Complication
						04 Presentation layer design	
16:25	16:45	0:20		18.9	14		Presentation
16:45	17:00	0:15		18.4	8		Photo service: Periodic slowdown.
17:00	17:10	0:10		12.5	5		Design Challenge #3 - Growth
DAY 1 ENDS							
DAY 2 BEGINS							
9:00	9:50	0:50		48	14		Deployment Manager - Adding Load Balancing
						05 Design for resiliency, scalability, and disaster recovery	
9:50	10:50	1:00		62.1	46		Presentation
10:50	11:05	0:15			MORNING BREAK		
11:05	11:25	0:20		27.6	12		Photo service: Out of service!
11:25	11:40	0:15		15	6		Design Challenge #4 - Redesign for time
11:40	12:40	1:00			LUNCH		
						06 Design for security	
12:40	13:25	0:45		47.25	35		Presentation
13:25	13:55	0:30		34.5	15		Photo service: Intentional attack.
13:55	14:25	0:30		15	6		Design Challenge #5 - Defense in depth
14:25	14:40	0:15			AFTERNOON BREAK		
						07 Capacity planning and cost optimization	
14:40	15:10	0:30		32.4	24		Presentation
15:10	15:25	0:15		11.5	5		Photo service: Cost and capacity.
15:25	15:40	0:15		20	8		Design Challenge #6 - Dimensioning
						08 Deployment, monitoring and alerting, and incident response	
15:40	16:10	0:30		37.8	28		Presentation
16:10	16:25	0:15		9.2	4		Photo service: Stabilization and operation.
16:25	16:40	0:15		12.5	5		Design Challenge #7 - Monitoring and alerting
16:25	17:00	0:35		39	13		Deployment Manager - Full Production + (Stackdriver)
						09 Completion	
17:00	17:10	0:10		9.45	7		Presentation

