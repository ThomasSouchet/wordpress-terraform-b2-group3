resource "aws_ssm_parameter" "db" {
  name  = "b2group3_db"
  type  = "String"
  value = aws_db_instance.rds.name
}

resource "aws_ssm_parameter" "user" {
  name  = "b2group3_user"
  type  = "String"
  value = aws_db_instance.rds.username
}

resource "aws_ssm_parameter" "password" {
  name   = "b2group3_password"
  type   = "SecureString"
  key_id = aws_kms_key.params.id
  value  = random_password.password.result
}

resource "aws_ssm_parameter" "entrypoint" {
  name  = "b2group3_entrypoint"
  type  = "String"
  value = aws_db_instance.rds.endpoint
}

resource "aws_ssm_parameter" "auth_key" {
  name  = "b2group3_auth_key"
  type  = "String"
  value = "+Y6~IuNg0oBvHY!0LRp)v9W~NvBtqy+N-7]kKf8sw&2fl4uyB7wb+&x..@k3V).W"
}

resource "aws_ssm_parameter" "secure_auth_key" {
  name  = "b2group3_secure_auth_key"
  type  = "String"
  value = "B|~`Iu;|Tdyr<EyyH!{veG:{MI3;c%|-)G/63f86B(Gh3xao/fZm3++|cl!aIgi0"
}

resource "aws_ssm_parameter" "logged_in_key" {
  name  = "b2group3_logged_in_key"
  type  = "String"
  value = ".RyJZtjy.O7:K<7!1/,:Ck#=>w7.pjA[_-xteRA^.tQc|]-*2#,>9$Jvm#)N)NUC"
}

resource "aws_ssm_parameter" "nonce_key" {
  name  = "b2group3_nonce_key"
  type  = "String"
  value = "6Gh=o8Tpf{ZCF_9u)+T4YG?&2/qk(0+nVL<gpU>lIckXg7IE+781`VO0Mjy]Y^WP"
}

resource "aws_ssm_parameter" "auth_salt" {
  name  = "b2group3_auth_salt"
  type  = "String"
  value = "y75Bm! L.Y+f(.$}|}*:%|n34O2g?2DDZ~P0*x9Bvg(E$!quFU%n-(iX82 zgQ#y"
}

resource "aws_ssm_parameter" "secure_auth_salt" {
  name  = "b2group3_secure_auth_salt"
  type  = "String"
  value = "U[`w|t?#8+gX|xkEd[`yV7%#[XEuwvCUM3urZ-||#{<X$|k%1s1TS9VF}}L7_fE!"
}

resource "aws_ssm_parameter" "logged_in_salt" {
  name  = "b2group3_logged_in_salt"
  type  = "String"
  value = "9kSJ+$>a$#Wq22J++XtIE0(!f0i>GV(BpOwKj^|,(F}]7Y&q <,pk%V%_#T<<*$B"
}

resource "aws_ssm_parameter" "nonce_salt" {
  name  = "b2group3_nonce_salt"
  type  = "String"
  value = "UaRZAeml=Hszj7e]Ry-~FV]pi/M#/HL=NuAmWDGy)*gNZX/)x^88aI{)u?821Y3e"
}