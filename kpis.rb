# main.rb
require_relative "main"

today = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
yesterday = Date.today.prev_day.strftime('%Y-%m-%d') + Time.now.strftime('T%H:%M:%S.%L%z')
last_week = Date.today.prev_day(7).strftime('%Y-%m-%d') + Time.now.strftime('T%H:%M:%S.%L%z')
last_month = Date.today.prev_month.strftime('%Y-%m-%d') + Time.now.strftime('T%H:%M:%S.%L%z')
last_year = Date.today.prev_year.strftime('%Y-%m-%d') + Time.now.strftime('T%H:%M:%S.%L%z')

def get_questions_time_relative(initial_date, final_date)
#Code
hot_subjects = get_questions_in_date(initial_date, final_date)
summarized_hot_subjects = get_summarized_questions(hot_subjects)[0. .9].to_h
get_questions_from_hash(summarized_hot_subjects)
end

#
puts "Listar as disciplinas onde as questões foram as mais acessadas nas ultimas 24H \n"
puts get_questions_time_relative(yesterday, today)
puts "Listar as questões mais acessadas por semana \n"
puts get_questions_time_relative(last_week, today)
puts "Listar as questões mais acessadas por mês \n"
puts get_questions_time_relative(last_month, today)
puts "Listar as questões mais acessadas por ano \n"
puts get_questions_time_relative(last_year, today)