output "public_dns" {
  description = "Display the Public DNS of the EC2 Instance (Elastic IP)"
  value       = aws_eip.main.public_dns
}

output "for_prediction" {
  description = "Prediction endpoint using Elastic IP DNS"
  value       = "ubuntu@${aws_eip.main.public_dns}:8000/predict/"
}

output "for_prediction_ip" {
  description = "Prediction endpoint using Elastic IP address"
  value       = "http://${aws_eip.main.public_ip}:8000/predict/"
}
