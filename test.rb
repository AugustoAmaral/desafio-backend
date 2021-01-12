require_relative 'main'

def unit_test(value, expected)
  if value == expected
    print '.'
  else
    print 'F'
  end
end

today = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
yesterday =
  Date.today.prev_day.strftime('%Y-%m-%d') + Time.now.strftime('T%H:%M:%S.%L%z')
last_week =
  Date.today.prev_day(7).strftime('%Y-%m-%d') +
    Time.now.strftime('T%H:%M:%S.%L%z')
last_month =
  Date.today.prev_month.strftime('%Y-%m-%d') +
    Time.now.strftime('T%H:%M:%S.%L%z')
last_year =
  Date.today.prev_year.strftime('%Y-%m-%d') +
    Time.now.strftime('T%H:%M:%S.%L%z')

puts 'asserting is_date_in_range'
unit_test(is_date_in_range(today, today, today), true)
unit_test(is_date_in_range(yesterday, today, today), true)
unit_test(is_date_in_range(last_week, today, today), true)
unit_test(is_date_in_range(last_month, today, today), true)
unit_test(is_date_in_range(last_year, today, today), true)
puts
unit_test(is_date_in_range(today, today, yesterday), false)
unit_test(is_date_in_range(yesterday, today, yesterday), true)
unit_test(is_date_in_range(last_week, today, yesterday), true)
unit_test(is_date_in_range(last_month, today, yesterday), true)
unit_test(is_date_in_range(last_year, today, yesterday), true)
puts
unit_test(is_date_in_range(today, today, last_week), false)
unit_test(is_date_in_range(yesterday, today, last_week), false)
unit_test(is_date_in_range(last_week, today, last_week), true)
unit_test(is_date_in_range(last_month, today, last_week), true)
unit_test(is_date_in_range(last_year, today, last_week), true)
puts
unit_test(is_date_in_range(today, today, last_month), false)
unit_test(is_date_in_range(yesterday, today, last_month), false)
unit_test(is_date_in_range(last_week, today, last_month), false)
unit_test(is_date_in_range(last_month, today, last_month), true)
unit_test(is_date_in_range(last_year, today, last_month), true)
puts
unit_test(is_date_in_range(today, today, last_year), false)
unit_test(is_date_in_range(yesterday, today, last_year), false)
unit_test(is_date_in_range(last_week, today, last_year), false)
unit_test(is_date_in_range(last_month, today, last_year), false)
unit_test(is_date_in_range(last_year, today, last_year), true)
puts
puts 'Asserting get_questions_in_date'
puts '(Counted using ctrl+f in code editor)'
unit_test(
  get_questions_in_date(
    '2020-01-13T00:00:00.000-03:00',
    '2020-01-13T23:59:59.999-03:00'
  ).length,
  254
)
unit_test(
  get_questions_in_date(
    '2019-08-21T00:00:00.000-03:00',
    '2019-08-21T23:59:59.999-03:00'
  ).length,
  269
)
unit_test(
  get_questions_in_date(
    '2019-10-02T00:00:00.000-03:00',
    '2019-10-02T23:59:59.999-03:00'
  ).length,
  291
)
unit_test(
  get_questions_in_date(
    '2020-03-09T00:00:00.000-03:00',
    '2020-03-09T23:59:59.999-03:00'
  ).length,
  295
)
unit_test(
  get_questions_in_date(
    '2019-10-01T00:00:00.000-03:00',
    '2019-10-01T23:59:59.999-03:00'
  ).length,
  297
)

puts
