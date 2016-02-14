library(shiny)
library(rjson)
library(stringr)

#load dataset and shuffle questions
json_data <- fromJSON(file='JEOPARDY_QUESTIONS1.json')
json_data = sample(json_data)


question = function(round_nr){
	return(str_replace_all(json_data[[round_nr]][['question']],"\'", ""))
}

answer = function(round_nr){
	return(json_data[[round_nr]][['answer']])
}

value = function(round_nr){
	val = json_data[[round_nr]][['value']]
	return(str_replace(val, "\\$", ""))
}

shinyServer(function(input, output, session) {

			values <- reactiveValues(	points = 0, 
										round_nr = 1)
			
			
			
			
			#update the points variable
			observeEvent(input$submitAnswerButton, {
						
						isolate({
									values$round_nr = values$round_nr + 1
									
									
									given_answer  = tolower(as.character(input$answer))
									correct_answer = tolower(as.character(answer(values$round_nr-1)))
									
									if(given_answer != ""){
										if(grepl(given_answer, correct_answer)){
											values$points <- values$points + as.numeric(value(values$round_nr))
										}
										else{
											values$points <- values$points - as.numeric(value(values$round_nr))
										}
									}
									
									
									#update output of answer and questions
									output$question <- renderText({
												paste("The question was: \n ", question(isolate({values$round_nr})-1))
											})
									
									output$answer <- renderText({
												paste("Your answer: \n", isolate({input$answer}))
											})
									
									output$correct_answer <- renderText({
												paste("The correct answer: \n", answer(isolate({values$round_nr})-1))
											})

								})	
					})
			
			#update variables on click of next question button
			observeEvent(input$skipButton, {
						
						isolate({
									values$round_nr = values$round_nr + 1
									values$points <- values$points -1
								})
					})
			
			
			
			#update points in UI
			output$helptext <- renderUI({
						helpText(paste(value(values$round_nr), ' points for this question'))
					})
			
			#update the question in UI
			observe({		
						updateTextInput(session, "answer",
							label = paste(as.character(question(values$round_nr))),
							value = ""
						)
			})

	
	
			#update ouput of points and round_nr whenever they change
			output$round_nr <- renderText({
						paste("Round No ", as.character(values$round_nr-1))
					})
			
			output$points <- renderText({
						paste("Your score: ",  as.character(values$points))
					})
			
			

			

			
	
			
})

