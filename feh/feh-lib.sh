function start_feh() {
  echo $1
  feh -ZF -q --hide-pointer -f $1
}

NOT_PHOTO="so\|psd\|aspx\|exe\|db\|htm\|pps\|doc\|xls\|html\|tar.gz\|js\|css\|deb\|pdf\|zip\|rb\|py\|c\|java\|flv\|mpg\|mpeg\|avi\|mov\|wmv"
