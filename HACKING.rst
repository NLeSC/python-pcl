
Ensure a good code quality:

 * Follow the PEP8 standards: https://www.python.org/dev/peps/pep-0008/. You can check this using the pep8 tool. (find . -name '*.py' -exec autopep8 -i {} \;)

 * Fix errors and warnings reported by pyflakes. https://pypi.python.org/pypi/pyflakes

 * We use travis for continuous integration.


Documentation
-------------

Generating the documentation goes as follows:

1. Commit all changes to your branch (master)

2. Generate and check the new documentation by doing  `make showdoc`

3. do a `make gh-pages`

4. do a `git push --all`
