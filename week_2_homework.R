set.seed (15)
hw2 <- runif (50, 4, 50)
hw2 <- replace (hw2, c (4, 12, 22, 27), NA)
hw2
rm ('NA')
is.na(hw2)
hw2
prob1 <- (14:38,na.rm=True)
hw2
hw2[!is.na(hw2)]
hw2
na.omit(hw2)
hw2
na.omit(hw2)
prob1 <- hw2[hw2 < 50 | hw2> 14]
prob1
prob1 <- hw2 [hw2<38 | hw2 > 14]
prob1
prob1 <- hw2 [hw2<38 & hw2 > 14]
prob1
na.omit(prob1)
times3 <- prob1*3
times3
na.omit(times3)
plus10 <- times3+10
plus10
na.omit(plus10)
plus10 <- na.omit(plus10)
plus10
?seq
plus10
plus10[remove(c(true,false))]
plus10[c(TRUE,FALSE)]
