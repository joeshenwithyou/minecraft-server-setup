variable "your_public_key_path" {
  type        = string
  description = "Path to your SSH public key"
  default     = "PATH/TO/KEY.pub"
}

variable "mojang_server_url" {
  type        = string
  description = "URL to the Minecraft server jar file"
}
