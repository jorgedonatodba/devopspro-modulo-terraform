
 output "lb_ip" {
   value = module.wp_stack.lb_ip
 }

 output "lb_id" {
   value = module.wp_stack.lb_id
 }

 output "lb_urn" {
   value = module.wp_stack.lb_urn
 }

 output "wp_vm_ips" {
   value = module.wp_stack.wp_vm_ips
 }

  output "nfs_vm_ip" {
   value = module.wp_stack.nfs_vm_ip
 }

 output "database_username" {
   value     = module.wp_stack.database_username
 
 }

 output "database_password" {
   value = module.wp_stack.database_password
   sensitive = true
 }

  output "cluster_host" {
   value = module.wp_stack.cluster_host
   sensitive = true   
 }

  output "cluster_port" {
   value = module.wp_stack.cluster_port
   sensitive = true   
 }

   output "cluster_uri" {
   value = module.wp_stack.cluster_uri
   sensitive = true   
 }