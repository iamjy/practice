import sys
import gdb

# Update module path.
dir_ = '/home/iamjy1005/work/lab/practice/user-library/src/opsrc-gtk+/glib-2.54.3/output/x86_64/share/glib-2.0/gdb'
if not dir_ in sys.path:
    sys.path.insert(0, dir_)

from glib_gdb import register
register (gdb.current_objfile ())
