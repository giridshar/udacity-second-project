# Infrastructure
terraform - infrastucture as code on AWS
## AWS Zones
Identify your zones here
["us-east-2a","us-east-2b"]
["us-west-1a", "us-west-1c"]
## Servers and Clusters
1 kubenetes cluster
1 RDS
2 EC2 instances. Details below.

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name | Brief description | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |

US EAST 2
| Asset         | purpose                              | type                    |
|---------------|--------------------------------------|-------------------------|
| EC2           | Database/compute                     | t3 medium               |
| EC2           | Website                              | t3 micro                |
| EKS 1 node    | run prometheus and grafana           | 1.21 kubernetes version |
| load balancer | 1 LB to access grafana from outside  |                         |
| S3 bucket     | To support the terraform resources   |                         |
| RDS           | For hosting DB                       | MYsql Aurora            |
| AMI           | for cloning the EC2 instance         |                         |

US WEST 1
| Asset         | purpose                              | type                    |
|---------------|--------------------------------------|-------------------------|
| EC2           | Database/compute                     | t3 medium               |
| EC2           | Website                              | t3 micro                |
| EKS 1 node    | run prometheus and grafana           | 1.21 kubernetes version |
| load balancer | 1 LB to access grafana from outside  |                         |
| S3 bucket     | To support the terraform resources   |                         |
| RDS           | For hosting DB                       | MYsql Aurora            |
| AMI           | for cloning the EC2 instance         |                         |

### Descriptions
More detailed descriptions of each asset identified above.
Have 2 EC2 instances in each region to support the application 
Need to have a kubernetes cluster setup to host grafana and prometheus
Load balancer is required to access the grafana from outside of AWS env
S3 bucket is required for terraform to run
RDS is required for hosting the DB and performing write to it.
## DR Plan
Create a cloud load balancer and point DNS to the load balancer. This way you can have multiple instances behind 1 IP in a region. During a failover scenario, you would fail over the single DNS entry at your DNS provider to point to the DR site. This is much more intelligent than pointing to a single instance of a web server.

Have a replicated database and perform a failover on the database. While a backup is good and necessary, it is time-consuming to restore from backup. In this DR step, you would have already configured replication and would perform the database failover. Ideally, your application would be using a generic CNAME DNS record and would just connect to the DR instance of the database.
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

Ensure both sites are configured the same
use infrastructure as code (terraform)

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

Point your DNS to your secondary region
This can be done with a name provider like Amazon route 53
Failover your database replication instances to another region
Manually force the secondary region to become primary at the database level, or
Automatically failover the database by health checks
