|Travis|_ |Quality-score|_ |Coverage|_

.. |Travis| image:: https://travis-ci.org/NLeSC/python-pcl.svg
.. _Travis: https://travis-ci.org/NLeSC/python-pcl

.. |Quality-score| image:: https://scrutinizer-ci.com/g/NLeSC/python-pcl/badges/quality-score.png?b=master
.. _Quality-score: https://scrutinizer-ci.com/g/NLeSC/python-pcl/

.. |Coverage| image:: https://scrutinizer-ci.com/g/NLeSC/python-pcl/badges/coverage.png?b=master
.. _Coverage: https://scrutinizer-ci.com/g/NLeSC/python-pcl/

Introduction
============

This is a small python binding to the `pointcloud <http://pointclouds.org/>`_ library.
Currently, the following parts of the API are wrapped (all methods operate on PointXYZRGB)
point types

 * I/O and integration; saving and loading PCD files
 * segmentation
 * SAC
 * smoothing
 * filtering

The code tries to follow the Point Cloud API, and also provides helper function
for interacting with NumPy.

Point clouds can be viewed as NumPy arrays, so modifying them is possible
using all the familiar NumPy functionality:

.. code-block:: python

    import numpy as np
    import pcl
    p = pcl.PointCloud(10)  # "empty" point cloud
    a = np.asarray(p)       # NumPy view on the cloud
    a[:] = 0                # fill with zeros
    print(p[3])             # prints (0.0, 0.0, 0.0)
    a[:, 0] = 1             # set x coordinates to 1
    print(p[3])             # prints (1.0, 0.0, 0.0)

More samples can be found in the `examples directory <https://github.com/NLeSC/python-pcl/tree/master/examples>`_,
and in the `unit tests <https://github.com/NLeSC/python-pcl/blob/master/tests/test.py>`_.

This library is developed for use in our Project Patty, see `this repository <https://github.com/NLeSC/PattyAnalytics/>`_ for more interesting examples.
Also, the reading and writing of LAS files is implemented there.

This work was supported by `Strawlab <http://strawlab.org/>`_ and `the Netherlands eScience Center <http://nlesc.nl/>`_


Requirements
------------

This release has been tested on Linux Mint 17 with

 * Python 2.7.9
 * pcl 1.7.2
 * Cython 0.22

A note about types
------------------

Point Cloud is a heavily templated API, and consequently mapping this into
Python using Cython is challenging. 

It is written in Cython, and implements enough hard bits of the API
(from Cythons perspective, i.e the template/smart_ptr bits)  to
provide a foundation for someone wishing to carry on.


API Documentation
=================

.. autosummary::
   pcl.PointCloud
   pcl.Segmentation
   pcl.SegmentationNormal
   pcl.StatisticalOutlierRemovalFilter
   pcl.MovingLeastSquares
   pcl.PassThroughFilter
   pcl.VoxelGridFilter

For API documentation, look at our `gh-pages branch <http://nlesc.github.io/python-pcl/>`_
For deficiencies in this documentation, please consult the
`PCL API docs <http://docs.pointclouds.org/trunk/index.html>`_, and the
`PCL tutorials <http://pointclouds.org/documentation/tutorials/>`_.

.. automodule:: pcl
   :members:
   :undoc-members:

