library(shiny)
library(rjson)

#run
#runApp('/usr/users/svorber/work/scripts/data_products_shiny_quizz/')

#load dataset
#json_data <- fromJSON(file='/home/vorberg/Desktop/JEOPARDY_QUESTIONS1.json')


shinyUI(pageWithSidebar(
				headerPanel('Playing Jeopardy'),
				sidebarPanel(

						h3(helpText("The next question:")),
						h3(textInput("answer", 
								label = "",#paste(json_data[[1]][['question']]), 
								value = "")),
						h3(uiOutput('helptext')),
						actionButton('submitAnswerButton',"Submit my answer!"),
						actionButton('skipButton', "Skip", icon = NULL),
						hr(),
						helpText("This shiny app simulates the quizz game 'Jeopardy'. 
								Questions will be displayed in the panel on the left, along with the score for this question. 
								Skipping a question will get you a penalty of 1. 
								Correctly answering a question will add the score of that question to your score. 
								Answering incorrectly will get you a penalty in the amount of the score for that question. 
								Answers are parsed in a way, that capitalization does not matter.
								The datset was taken from:  https://www.reddit.com/r/datasets/comments/1uyd0t/200000_jeopardy_questions_in_a_json_file.
 								")
						
						
						

				),
				mainPanel(
						h2(textOutput("round"), style = "color: #F56G33"),
						h3(textOutput("points"), style = "color: #7f0000"),
						hr(),
						textOutput("question"),
						textOutput("answer"),
						textOutput("correct_answer")
				)
		))

