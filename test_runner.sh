#! /bin/bash
if test -f "manage.py"; then
    echo "Detected Django project - running framework specific tests."
    python ./manage.py test
else
    echo "It's Django-free project :) Enjoy pure pytest."
    # we are calling pytest as python module (not as registered application 
    # which is called just as `pytest`) to exclude possibility that we will 
    # invoke incorrect one (e.g. installed by system not conda)
    python -m pytest -v; ret=$?; [ $ret = 5 ] && exit 0 || exit $ret
fi
