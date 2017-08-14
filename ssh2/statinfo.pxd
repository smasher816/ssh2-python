from c_ssh2 cimport libssh2_struct_stat


cdef class StatInfo:
    """Representation of stat structure - older version"""
    cdef libssh2_struct_stat* _stat
