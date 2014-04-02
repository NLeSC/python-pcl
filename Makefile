all: pcl/_pcl.so pcl/registration.so pcl/boundaries.so

SOURCE_FILES=pcl/_pcl.pxd pcl/registration.pyx pcl/pcl_defs.pxd pcl/boundaries.pyx

pcl/_pcl.so: $(SOURCE_FILES) pcl/_pcl.pyx setup.py \
             pcl/minipcl.cpp pcl/indexing.hpp
	python setup.py build_ext --inplace --cython-include-dirs=/usr/local/include --include-dirs=/usr/local/include

pcl/registration.so: $(SOURCE_FILES) setup.py pcl/registration_helper.cpp
	python setup.py build_ext --inplace --cython-include-dirs=/usr/local/include --include-dirs=/usr/local/include

pcl/boundaries.so: $(SOURCE_FILES) setup.py
	python setup.py build_ext --inplace --cython-include-dirs=/usr/local/include --include-dirs=/usr/local/include

test: pcl/_pcl.so tests/test.py pcl/registration.so pcl/boundaries.so
	nosetests --with-coverage --cover-package=pcl

clean:
	rm -rf build
	rm -f pcl/*.so
	rm -f pcl/_pcl.cpp pcl/boundaries.cpp pcl/registration.cpp

doc: build/html/readme.html

build/html/readme.html: pcl/_pcl.so conf.py readme.rst
	sphinx-build -b singlehtml -d build/doctrees . build/html

gh-pages: doc
	touch build/html/.nojekyll
	./commit-to-gh-pages.sh build/html

showdoc: doc
	gvfs-open build/html/readme.html
