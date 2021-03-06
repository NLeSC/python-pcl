# Header for _pcl.pyx functionality that needs sharing with other
# modules.

cimport pcl_defs as cpp


cdef class BasePointCloud:
    cdef cpp.PointCloudPtr_t thisptr_shared

    # Buffer protocol support.
    cdef Py_ssize_t _shape[2]
    cdef Py_ssize_t _view_count

    cdef inline cpp.PointCloud[cpp.PointXYZRGB] *thisptr(self) nogil:
        # Shortcut to get raw pointer to underlying PointCloud<PointXYZRGB>.
        return self.thisptr_shared.get()
