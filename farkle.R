library(tidyverse)

winning_probs <- read.csv("winning_probs.csv", header=TRUE)

winning_probs <- data.frame(winning_probs)

winning_probs <- winning_probs %>% 
        gather(key = num_dice, value = probability, roll1, roll2, roll3, roll4, roll5, roll6) %>% 
        arrange(value)

stop_or_roll <- function(score, dice) {
        farkle_probs <- data.frame(outcome = c("farkle", "farkle", "farkle", "farkle", "farkle", "farkle"),
                                  value = c(NA, NA, NA, NA, NA, NA),
                                  num_dice = c("roll1", "roll2", "roll3", "roll4", "roll5", "roll6"),
                                  probability = c(0.6667, 0.4444, 0.2778, 0.1575, 0.0769, 0.0238))
        farkle_probs$value[1:6] <- -(score)
        all_probs <- rbind(winning_probs, farkle_probs)
        all_utils <- all_probs %>% group_by(num_dice) %>% summarise(exp_util = sum(probability*value))
        if (dice == 6) {
                if (0 < all_utils$exp_util[6]) {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[6]))
                        print("Roll away!")
                } else {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[6]))
                        print("Stop now.")
                }
                return (all_utils$exp_util[6])
        } else if (dice == 5) {
                if (0 < all_utils$exp_util[5]) {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[5]))
                        print("Roll away!")
                } else {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[5]))
                        print("Stop now.")
                }
                return (all_utils$exp_util[5])
        } else if (dice == 4) {
                if (0 < all_utils$exp_util[4]) {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[4]))
                        print("Roll away!")
                } else {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[4]))
                        print("Stop now.")
                }
                return (all_utils$exp_util[4])
        } else if (dice == 3) {
                if (0 < all_utils$exp_util[3]) {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[3]))
                        print("Roll away!")
                } else {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[3]))
                        print("Stop now.")
                }
                return (all_utils$exp_util[3])
        } else if (dice == 2) {
                if (0 < all_utils$exp_util[2]) {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[2]))
                        print("Roll away!")
                } else {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[2]))
                        print("Stop now.")
                }
                return (all_utils$exp_util[2])
        } else if (dice == 1) {
                if (0 < all_utils$exp_util[1]) {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[1]))
                        print("Roll away!")
                } else {
                        print(paste0("Expected value of rolling: ", all_utils$exp_util[1]))
                        print("Stop now.")
                }
                return (all_utils$exp_util[1])
        } else {
                print("Dice input must be 1, 2, 3, 4, 5, or 6.")
        }
}

stop_or_roll(score = 36600, dice = 6)

stop_or_roll(score = 6500, dice = 5)

stop_or_roll(score = 1700, dice = 4)

stop_or_roll(score = 450, dice = 3)

stop_or_roll(score = 200, dice = 2)

stop_or_roll(score = 250, dice = 1)


# How to win at Farkle:
# 1. If you can roll five or six dice, *always* do so.
# 2. If you can roll four dice, do so unless it means risking 1700 points or more.
# 3. If you can roll three dice, do so unless it means risking 450 points or more.
# 4. If you can only roll one or two dice, *never* do so unless you're not on the board yet and you still have less than 500 points in your current turn.

farkle_chart <- data.frame(dice_remaining = c(6, 5, 4, 3, 2, 1), stop_if_turn_score_higher_than = c(36600, 6500, 1700, 450, 200, 0))
knitr::kable(farkle_chart)
