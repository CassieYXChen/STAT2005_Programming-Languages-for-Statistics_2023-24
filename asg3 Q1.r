# Q1
questionaire <- function() {
  cat("Please respond to the following three questions.\n")
  name <- vector()
  age <- vector("integer")
  gender <- vector("character")

  while (TRUE) {
    cat("Question 1: What's your name? : ")
    name_input <- readline()
    name <- append(name, name_input)

    while (TRUE) {
      cat("Question 2: What's your age? <positive integer required>: ")
      age_input <- readline()
      if (grepl("^[0-9]+$", age_input) && as.integer(age_input)>0) {
        age <- append(age, as.integer(age_input))
        break
      } else {
        cat("Please input positive integer.\n")
        next
      }
    }

    while (TRUE) {
      cat("Question 3: What's your gender? <M/F>: ")
      gender_input <- readline()
      if (gender_input %in% c("M", "m", "F", "f")) {
        gender <- append(gender, toupper(gender_input))
        break
      } else {
        cat("Please input M or F. \n")
        next
      }
    }

    # Ask if a new entry is required
    flag <- 0
    while (TRUE) {
      new_entry <- readline("New entry? (Y/N): ")
      if (new_entry == "N" || new_entry == "n") {
        flag <- 0
        break
      }
      else if (new_entry == "Y" || new_entry == "y") {
        flag <- 1
        break
      }
      else {
        cat("Please input Y or N. \n")
        flag <- 0
        next
      }
    }
    if (flag == 1) {
      next
    } else {
      break
    }
  }

  data <- data.frame(Name = name, Age = age, Gender = gender)
  
  # Summary information
  cat(paste("The average age is", mean(age), "from", length(name), "respondents.\n"))

  # Pie chart
  gender_counts <- table(gender)
  pie(gender_counts, labels = names(gender_counts))
  
  # Data frame
  print(data)
}

data <- questionaire()