vpc_cidr           = "10.0.0.0/16"
vpc_name           ="tf-test"
subnet_cidr        ="10.0.0.0/24"
subnet_zone        ="us-west-2a"
subnet_name        ="tf-test" 
subnet_group_name  ="tf-test-cache-subnet"
cluster_id         ="cluster-example"
cluster_engine     ="redis"
cluster_node_type  ="cache.m4.large"
engine_version     ="3.2.10"
port               ="6379"            
security_group_name="security-group"
elasticache_security_group_name ="elasticache-security-group"


