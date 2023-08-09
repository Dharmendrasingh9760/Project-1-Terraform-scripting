resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id]
  tags = {
    Name = "My DB subnet group"
}
}
resource "aws_db_instance" "default" {
  allocated_storage = 10
  db_subnet_group_name = aws_db_subnet_group.default.id
  engine = "mysql"
  engine_version = "8.0.33"
  instance_class = "db.r6g.16xlarge"
  multi_az = true
  db_name = "db_1"
  username = "username"
  password = "password"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  tags = {
    db_identifier= "DB-1"

}
}
