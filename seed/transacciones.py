import random
import datetime
import time


def getDate(start="1/1/1970 1:30 PM", end="3/20/2023 4:50 AM", time_format='%m/%d/%Y %I:%M %p', prop=random.random()):
    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))

    ptime = stime + prop * (etime - stime)

    return datetime.datetime.fromtimestamp(ptime).isoformat()[:19].replace('T', ' ')


print(getDate())
