#! /bin/bash
if test -f "manage.py"; then
    echo "Detected Django project - running framework specific tests."
    python ./manage.py test
else
    echo "It's Django-free project :) Enjoy pure pytest."
    pytest -v; ret=$?; [ $ret = 5 ] && exit 0 || exit $ret
fi
