resource local_file "my_file" {
  content  = "Hello, World!"
  filename = "${path.module}/hello.txt"
}