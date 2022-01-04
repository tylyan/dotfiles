#!/usr/bin/python3

import sys
import textwrap

from datetime import datetime, timedelta

DATE_FORMAT = '%Y-%m-%d'
DAILY_FORMAT = '%A %m/%d'

def get_date_from_file_name(filename, date_format):
    return datetime.strptime(filename.rsplit('.', 1)[0].rsplit('/', 1)[-1], date_format)

def fmt_str(s):
    return textwrap.dedent(s).strip()

def header(date):
    iso_cal = datetime.today().isocalendar()
    week_num = iso_cal[1]
    if iso_cal[2] == 7:
        week_num += 1

    return fmt_str(f"""
    # Week {week_num}: {date.strftime(DATE_FORMAT)} ~ {(date + timedelta(days=6)).strftime(DATE_FORMAT)}

    **Theme:**
    **Location:**

    ## This Week's Focus
    * [ ] 

    ## Habits
    | Habit       | Sun | Mon | Tue | Wed | Thu | Fri | Sat |
    | -----       | --- | --- | --- | --- | --- | --- | --- |
    | Drink water |     |     |     |     |     |     |     |
    | Meditate    |     |     |     |     |     |     |     |
    | Plan day    |     |     |     |     |     |     |     |
    | Review day  |     |     |     |     |     |     |     |

    ## Trackers
    | Name                 | Sun | Mon | Tue | Wed | Thu | Fri | Sat |
    | -----                | --- | --- | --- | --- | --- | --- | --- |
    | Cl 0.1 E (m)         |     |     |     |     |     |     |     |
    | Da 25 E (m)          |     |     |     |     |     |     |     |
    | Da 25 E (n)          |     |     |     |     |     |     |     |
    | Cl 0.05 I (n)        |     |     |     |     |     |     |     |

    ## Mood
    | Sun | Mon | Tue | Wed | Thu | Fri | Sat |
    | --- | --- | --- | --- | --- | --- | --- |
    |     |     |     |     |     |     |     |

    ## Daily Notes
    ---
    """)

def daily_template(date_string):
    return fmt_str(f"""
    ### {date_string}

    #### Gratitude

    | Time    | Notes |
    | -----   | ---   |
    | 05:00am |       |
    | 06:00am |       |
    | 07:00am |       |
    | 08:00am |       |
    | 09:00am |       |
    | 10:00am |       |
    | 11:00am |       |
    | 12:00pm |       |
    | 01:00pm |       |
    | 02:00pm |       |
    | 03:00pm |       |
    | 04:00pm |       |
    | 05:00pm |       |
    | 06:00pm |       |
    | 07:00pm |       |
    | 08:00pm |       |
    | 09:00pm |       |
    | 10:00pm |       |
    | 11:00pm |       |
    | 12:00am |       |
    | 01:00am |       |
    """)

if __name__ == '__main__':
    date = datetime.today() \
            if len(sys.argv) < 2 \
            else get_date_from_file_name(sys.argv[1], DATE_FORMAT) # Expecting filename in YYYY-MM-DD.foo format, starts on Sunday

    print(header(date))
    for i in range(7):
        date_string = (date + timedelta(days=i)).strftime(DAILY_FORMAT) # 'DayOfWeek, Month Day Year'
        print(f'\n{daily_template(date_string)}')
