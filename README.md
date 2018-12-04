**WARNING** backup your Darktable database before any actions,
usually it located in ~/.config/darktable/*.db

Also be careful with rm command, it is better also to backup all files 

Delete, rename, create tags

`dtag` list used tags 

`dtag -d 'wood'` delete tag wood

`dtag -r 'old name' -n 'new name'` rename tag 

Cleanup database

`dt_db --help`

Dump metada to stdout in JSON format

`dt_dump`

Restore meta from stdin, there is a lot of command line flags

`dt_restore --help`

Restore dump, enable tag add and delete, ignote tag 'winter', dry mode

`cat dump.json | ./dt_restore --at --dt -i winter -n`

Find non imported files in roll directories

`dt_files --nf`

Find orphaned xmp and delete them, use with care (remove echo)

`dt_files --ox | xargs -0 echo rm -v`

Helpers to send and receive export/import files

`meta_get`

`meta_send`

Config files for helpers

`meta.conf`

`meta.conf.example`
