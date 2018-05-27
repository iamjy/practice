import sys
import gdb

# Update module path.
dir_ = '/home/iamjy1005/work/lab/practice/user-library/src/opsrc-gtk+/glib-2.54.3/output/arm-linux-gnueabi/share/glib-2.0/gdb'
if not dir_ in sys.path:
    sys.path.insert(0, dir_)

from gobject_gdb import register
register (gdb.current_objfile ())
