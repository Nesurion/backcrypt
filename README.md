backcrypt
======

Small backup- and encryption-script, developed in ruby.

Configuration
--------------
Directory path, and zipfile_name configuration in config.json
e.g.:
{
"directory" : "/Users/<username>/Desktop/test/",
"zipfile_name" : "/Users/<username>/Desktop/archive.zip"
}

Coming Features

Backup
--------
  - Recoursive folder backup
  - database dump
  - automatic dropbox/s3/google drive upload

Compression
------------
  - .rar
  - .zip
  - .tar.gz

Encryption:
No concrete plan yet. Maybe i will implement the gibberish RubyGem.

feedback very welcome!

