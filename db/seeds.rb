# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'csv'

CSV.foreach(Rails.root.join('db/options_seeds', headers: true)) do |row|
    
    row_prompt = row['prompt']
    question = Question.find_by(prompt: row_prompt)
    #if the prompt is not already in the db, create a new Question
    question = Question.create(prompt: row_prompt) if !question 

    
    Option.create(question_id: question.id,
    image: row['name'] + question.id.to_s)
    


end

def db_row_from_csv_row
