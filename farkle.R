library(tidyverse)

farkle_probs <- read.csv("farkle_probs.csv", header=TRUE)
farkle_probs <- data.frame(farkle_probs)
farkle_probs

farkle_probs <- farkle_probs %>% 
        gather(key = num_dice, value = probability, roll1, roll2, roll3, roll4, roll5, roll6) %>% 
        arrange(value)

exp_util_roll1 <- 
        
k <- farkle_probs %>%
        group_by(num_dice) %>% 
        summarise(sum(probability*value))

k

farkle(score, dice) {
        if (dice == 6) {
                if (score > ) {
                        return (TRUE)
                } else {
                        return (FALSE)
                }
        } else if (dice == 5) {
                if (score > ) {
                        return (TRUE)
                } else {
                        return (FALSE)
                }
        } else if (dice == 4) {
                if (score > ) {
                        return (TRUE)
                } else {
                        return (FALSE)
                }
        }  else if (dice == 3) {
                if (score > ) {
                        return (TRUE)
                } else {
                        return (FALSE)
                }
        }  else if (dice == 2) {
                if (score > ) {
                        return (TRUE)
                } else {
                        return (FALSE)
                }
        }  else if (dice == 1) {
                if (score > ) {
                        return (TRUE)
                } else {
                        return (FALSE)
                }
        } else {
                print("Dice input must be 1, 2, 3, 4, 5, or 6.")
        }
}