
 output "lb_ip" {
   value = digitalocean_loadbalancer.wp_lb.ip
 }

 output "lb_id" {
   value = digitalocean_loadbalancer.wp_lb.id
 }

 output "lb_urn" {
   value = digitalocean_loadbalancer.wp_lb.urn
 }

 output "wp_vm_ips" {
   value = digitalocean_droplet.vm_wp[*].ipv4_address
 }

  output "nfs_vm_ip" {
   value = digitalocean_droplet.vm_nfs.ipv4_address
 }

 output "database_username" {
   value     = digitalocean_database_user.wp_database_user.name
 
 }

 output "database_password" {
   value     = digitalocean_database_user.wp_database_user.password
   sensitive = true
 }

  output "cluster_host" {
   value     = digitalocean_database_cluster.wp_mysql.host
   sensitive = true
 }

  output "cluster_port" {
   value     = digitalocean_database_cluster.wp_mysql.port
   sensitive = true
 }

   output "cluster_uri" {
   value     = digitalocean_database_cluster.wp_mysql.uri
   sensitive = true
 }