# Alohomora

A spell in Harry Potter world.

Used to open and/or unlock doors, but doors can be bewitched so that this spell has no effect.

A script upload file to qiniu cloud storage.

## USAGE

1. create a soft link to /usr/bin

   `sudo ln -s [absolute path of alohomora.sh ]  /usr/bin/alohomora`

2. setup qiniu upload env

   `QINIU_ACCESS` is your qiniu account access key.

   `QINIU_SECRET` is your qiniu account secrect key.

   `QINIU_BUCKET` is your bucket name

   `QINIU_URL` is the public url for your bucket

3. use it

   `alohomora file_name`

## LICENSE

[WTFPL](https://en.wikipedia.org/wiki/WTFPL)
