# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'csv'
Question.destroy_all
Option.destroy_all
Ranking.destroy_all
CSV.foreach(File.open('db/options_seeds.csv'), headers: true, col_sep: ',') do |row|
    row_prompt = row['Category']
    question = Question.find_by(prompt: row_prompt)
    #if the prompt is not already in the db, create a new Question
    question = Question.create(prompt: row_prompt) if !question 

    #reference images by name and question id so that options for different
    #questions may share names
    name = row['Name']
    question_id_string = question.id.to_s
    image_string = name + question_id_string
    Option.create(question_id: question.id, name: name,
    image: image_string)

end


