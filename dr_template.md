# Infrastructure

## AWS Zones
Identify your zones here
Zone1: US-EAST-2
Zone2: US-WAEST-2

## Servers and Clusters

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| VPC | Virtual network | /16 | 2 | 2 zone(region), 1 VPC each region |
| EC2 | App/web server( + EC2-image, ssh keypair) | t3.micro | 6 | 2 zone(region), 3 instance each region |
| EKS | Kubernetes cluster(with prometheus, grafana installed) | t3.medium | 2 | 2 zone(region), 1 cluster each region, 2 nodes each cluster |            |
| S3  | Bucket for terraform  | - |   2   | 2 zone(region), 1 bucket each region |
| ALB | Application load balancer | - | 2 | 2 zone(region), 1 instance each region |
| RDS | Primary database| db.t3.micro | 1 | 1 cluster 2 node on zone 1 |
| RDS | Replica database| db.t3.micro | 1 | 1 cluster 2 node on zone 2 |

### Descriptions
- VPC:  Virtual Private Compute - Networking on cloud infrastructure
- EC2 instances:  Virtual Machine to running application
- EKS: Kubernetes cluster for running container application
- Prometheus Grafana: Monitoring stack
- S3 bucket: Store terraform state
- ALB: Load blancer for application
- RDS: Database

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.
- Because the system is already set to active-active across two regions,
when a region switch is needed, you only need to set the DNS to point to the ALB/RDS URL in the corresponding region

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region
- Database: Promote replicated cluster
- Traffic: Use Route 53 to configure DNS failover between regions (ALB of application, monitoring)