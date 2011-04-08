function start_mplayer() {
  mplayer -vo x11 -nocache -really-quiet -msglevel all=-1 -zoom -fs -playlist $1
}

NOT_VIDEO="bmp\|psd\|aspx\|exe\|db\|htm\|pps\|doc\|xls\|html\|tar.gz\|mp3\|js\|css\|deb\|mp3\|jpg\|jpeg\|png\|pdf\|zip\|gif\|rb\|py\|c\|java"
