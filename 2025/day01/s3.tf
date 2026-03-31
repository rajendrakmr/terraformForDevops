resource "aws_s3_bucket" "s3_bucket" {
    # bucket = "cloudwithrk-2025"
    # tags = {
    #   Name ="Cloud with rk"
    #   Enviroment = "dev"
    # }
    
}
resource aws_s3_bucket my_bucket {
    bucket = "cloudwithrk"
    tags = {
      Name ="Cloud with rk"
      Enviroment = "dev"
    }
    
}