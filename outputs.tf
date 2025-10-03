output "public_dns" {
  description = "Display the Public DNS of the EC2 Instance"
  value       = "ubuntu@${aws_instance.main.public_dns}"
}

output "for_prediction" {
  description = "Display the Public DNS of the EC2 Instance"
  value       = "ubuntu@${aws_instance.main.public_dns}:8000/predict/"
}
