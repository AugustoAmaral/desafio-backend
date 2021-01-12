require 'date'
require 'rubygems'
gem 'activesupport', '~> 4.2', '>= 4.2.6'
require 'active_support'
require 'json'

question_access_file = File.read("question_access.json")
questions_file = File.read("questions.json")

$question_access = JSON.parse(question_access_file)
$questions = JSON.parse(questions_file)

<<-DOC
A função is_date_in_range checa se a data dada está dentro do alcance e retorna true | false
    initial_date | Data no formato ISO 8601     -> é a data inicial
    final_date | Data no formato ISO 8601     -> é a data final
    compare_date | Data no formato ISO 8601     -> é a data que vai ser checada
DOC
def is_date_in_range(initial_date,final_date,compare_date)
    parsed_initial_date = Time.new(initial_date)
    parsed_final_date = Time.new(initial_date)
    parsed_compare_date = Time.new(compare_date)

    parsed_compare_date.between?(parsed_initial_date, parsed_final_date)
    # parsed_final_date <= parsed_compare_date && parsed_compare_date <= parsed_initial_date
    # (parsed_initial_date..parsed_final_date).cover? parsed_compare_date
end

<<-DOC
A função get_questions_in_date retorna todas as questões acessadas no intervalo de data
initial_date | Data no formato ISO 8601     -> é a data inicial
final_date | Data no formato ISO 8601     -> é a data final
DOC
def get_questions_in_date(initial_date,final_date)
    found_questions = []
    $question_access.each { |question_info|
            if (is_date_in_range(initial_date,final_date,question_info["date"]))
                puts question_info["date"]
            found_questions.append(question_info)
        end
    }
    found_questions
end

<<-DOC
A função get_summarized_questions return uma hash com o id e quantidade de acessos de um vetor de hash ordenado
questions | Hash no formato {question_id => id, date=> Data no formato ISO 8601, times_accessed=> inteiro}
retorna um vetor tipo: [[id, times_accessed],...,[id, times_accessed]]
DOC
def get_summarized_questions(questions)
    #Do the things
    all_questions = {}
    questions.each { |question|
        if all_questions[question["question_id"]]
            all_questions[question["question_id"]] = all_questions[question["question_id"]] + question["times_accessed"]
        else 
            all_questions[question["question_id"]] = question["times_accessed"]
        end
    }
    all_questions.sort_by{ |id, value| -value }
end

<<-DOC
A função get_questions_from_hash retorna as questões encontradas a partir de uma hash tipo {id => valor}
most_accessed_questions | Hash no formato {id => times_accessed,...,id => times_accessed}
retorna uma hash tipo questões com a key times_accessed e seu valor
DOC
def get_questions_from_hash(most_accessed_questions)
    # do the things
    top_questions = []
    $questions.each { |question_info|
        if (most_accessed_questions.keys.include?(question_info["id"]))
            question_info["times_accessed"] = most_accessed_questions[question_info["id"]]
            top_questions.append(question_info)
        end
    }
    top_questions
end