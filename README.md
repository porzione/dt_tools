**WARNING** backup your Darktable database before any actions
usually it located in ~/.config/darktable/*.db

Delete, rename, create tags

`dtag` list used tags 

`dtag -d 'wood'` delete tag zoo

Cleanup database

`dtdb`

Dump metada to stdout in JSON format

`dt_dump`

Restore meta from stdin

`dt_restore`

Restore dump, enable tag add and delete, ignote tag 'winter', dry mode

`cat dump.json | ./dt_restore --at --dt -i winter -n`

Find non imported files in roll directories

`dt_files`

Helpers to send and receive export/import files

`meta_get`

`meta_send`

Config files for helpers

`meta.conf`

`meta.conf.example`
