# Q1(a)
seq(10,30,2)

# Q1(b)
# 12345+00000, 12345+11111, 12345+22222...
rep(1:5,5) + rep(0:4,each=5) 


# Q2(a)
equation <- c(5,4,3,2,1,0)
roots <- polyroot(equation)

# Q2(b)
mode(roots)
# the answer is "complex"

# Q2(c)
# Use order() to sort roots according to their imaginary part(Im) in ascending order
sort <- roots[order(Im(roots))]


# Q3
deck <- data.frame(
  suit = rep(c("D","C","H","S"), 13),
  rank = rep(2:14, 4)
)
#deck

# Q3(a)
# deck has a two-dimention data structure. 
# It contains 52 rows and 2 columns in total. 
# The rows contain 52 pairs of suit and rank and each pair stands for a unique card. 
# The columns contain all suits ("D""C""H""S" each appear 13 times in order of "DCHS") and all ranks (values from 2 to 14 and repeat 4 times) of cards.

# Q3(b)
# Sample deck by row
hand <- deck[sample(nrow(deck), 5), c("suit", "rank")]

# Q3(c)
# unique() will only generate one value if all the values selected are the same, so the length is 1
# hand <- deck[c(17,29,41,1, 13), ]
is.flush <- length(unique(hand$suit)) == 1

# Q3(d)
ranks <- hand$rank
# all() is useful to help transfer complex data to TRUE or FALSE
# A straight is a sequence of 5 cards with consecutive ranks in ascending (the diff of each consecutive rank is 1) or descending (-1) order
# "A" is a special rank because it can be in both "A2345" and "10JQKA", and as the rank of "A" is 14, we need to specify "A2345" and "5432A"
is.straight <- ((max(ranks) - min(ranks) == 4) && length(unique(ranks)) == 5 && (all(diff(ranks) == 1) || all(diff(ranks) == -1))) || all(ranks == c(14,2,3,4,5)) || all(ranks == c(5,4,3,2,14))

# Q3(e)
is.straightflush <- is.straight && is.flush
# If is.straight is TRUE and is.straightflush is TRUE, is.straight <- FALSE; if TRUE FALSE, TRUE (only); if FALSE TRUE, impossible; if FALSE FALSE, FALSE. So is.straight = is.straight && (!is.straightflush)
is.straight <- is.straight && (!is.straightflush)
# Similarly
is.flush <- is.flush && (!is.straightflush)
#is.straightflush
#is.straight
#is.flush


# Q4(a)
#set.seed(100)
moves <- data.frame(
  die_1 = sample(1:6, 100, replace = TRUE),
  die_2 = sample(1:6, 100, replace = TRUE)
)

# Q4(b)
moves$step <- moves$die_1 + moves$die_2
moves$total_step <- cumsum(moves$step)
# 40 steps per round
moves$round <- floor(moves$total_step / 40)
# each side has 10 steps, %% takes the remainder
moves$side <- floor((moves$total_step %% 40) / 10) 
moves$land <- moves$total_step %% 10


# Q4(c)
# The location of PARKPLACE and BOARDWALK is (3,7) and (3,9)
both <- any(moves$side == 3 & moves$land == 7) && any(moves$side == 3 & moves$land == 9)
