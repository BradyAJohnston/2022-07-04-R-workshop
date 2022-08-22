1 + 1

30 * 10

5 / 7 

weight_kg <- 50

weight_kg / 10

# this converts weight from kg to pounds

weight_lb <- 2.2 * weight_kg

# this prints out the value
# It's written this way because I could
weight_lb


# mass_double <- mass * 2.0      # mass?


mass <- 47.5            # mass?
age  <- 122             # age?
mass_double <- mass * 2.0      # mass?
age  <- age - 20        # age?
(mass_index <- mass_double/age)  # mass_index?
mass_index

sqrt(20)

round(3.145)

round(3.145, digits = 1)
round(3.145, digits = 1)
?round


some_numbers <- c(10, 20, 30, 40)
some_numbers <- c(10, 20, 30, 40)

10 * 6
20 * 6
30 * 6

# some_numbers * 6

some_word <- "hello"
other_word <- 'world'
some_word

some_words <- c("hello", "world", "potato")

# some_words * 6
# R will convert everything to the same type in a vector

some_more_words <- c("hello", "world", 6)

some_words <- c(some_words, "bicylce")
some_words

c(some_words, some_more_words)

some_numbers

soem_numbers <- c(some_numbers, 30, 30, 80, 100)
soem_numbers

TRUE
FALSE
1 == 1
1 == 2
1 != 2
TRUE != FALSE

TRUE * 2
FALSE * 2

num_char <- c(1, 2, 3, "a")
num_char

#as.numeric("a")

num_logical <- c(1, 2, 3, TRUE)
num_logical

char_logical <- c("a", "b", "c", TRUE)
char_logical

tricky <- c(1, 2, 3, "4")

tricky

as.numeric(tricky)

animals <- c("mouse", "rat", "dog", "cat")

animals[2]
animals[5]

animals[c(1, 2)]

animals[c(1, 2, 1, 3, 1, 3, 4)]

animals == "mouse"

animals[animals == "mouse"]

weight_g <- c(21, 34, 39, 54, 55)

# find the values above 25
above_weight <- weight_g > 25
above_weight

# subset the values above 25
weight_g[above_weight]
weight_g[weight_g > 25]

weight_g > 30 & weight_g < 50
weight_g > 30 | weight_g < 50

weight_g > 40 | weight_g == 21



animals <- c("mouse", "rat", "dog", "cat", "cat")

# return both rat and cat
animals[animals == "cat" | animals == "rat"| animals == "dog"]

animals %in% c("cat", "rat")

animals[animals %in% c("cat", "rat")]

animals
animals[animals %in% c("rat", "cat", "dog", "duck", "goat", "bird", "fish")]


"four" > "five"

heights <- c(2, 4, 4, NA, 6)


heights
heights * 2
mean(heights)
mean(heights, na.rm = TRUE)

!is.na(heights)

heights[is.na(heights)]

heights[!is.na(heights)]

## check to see if values are NA
values_are_NA <- is.na(heights)
values_are_NA

# invert the test, so TRUE represents values that aren't NA
values_not_NA <- !values_are_NA
values_not_NA

# subset values which aren't NA
heights[values_not_NA]

na.omit(heights)

sum(c(1, 2, 3))
sum(c(TRUE, FALSE, TRUE))

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

heights_no_na <- heights[!is.na(heights)]

heights_no_na > 67
sum(heights_no_na > 67)

heights_no_na[heights_no_na > 67]

length(heights_no_na[heights_no_na > 67])
## Reading in Data

download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "portal_data_joined.csv")

getwd()


## load the tidyverse packages, incl. dplyr
library(tidyverse)

read_csv("portal_data_joined.csv")

our_data <- read_csv("portal_data_joined.csv")
our_data

read.csv("portal_data_joined.csv")

our_data$weight
our_data$record_id

our_data$record_id

our_data[1, 2]

our_data[1, ]

our_data[c(1, 3, 5), ]

our_data[c(1, 3, 5), c(1, 2, 3)]

our_data[c(1, 3, 5), c("record_id", "month", "day")]

our_data$weight

mean_weight <- mean(our_data$weight, na.rm = TRUE)
mean_weight

our_data[our_data$weight > mean_weight, ]

head(our_data)
tail(our_data)

str(our_data)


1:3
1:10
1:100000

our_data[1:100, "record_id"]

nrow(our_data)
ncol(our_data)

# subsetting based on dimensions of our data frame
our_data[nrow(our_data), 8:ncol(our_data)]

sex <- factor(c("male", "female", "female", "male"))


our_data[, -1]


factor(c("low", "low", "med", "high"), levels = c("low", "med", "high"))


# selecting columns

select(our_data, record_id, month, species_id)
select(our_data, -record_id, -month)

slice(our_data, 1:10)
our_data[1:10, ]

filter(our_data, month < 6)

my_output <- our_data %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)


my_output


our_data %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight) %>% 
  mutate(weight = weight / 1000)

our_data %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight) %>% 
  mutate(weight_g = weight / 1000)

our_data %>% 
  # filter(weight < 5) %>% 
  filter(!is.na(weight)) %>% 
  select(species_id, sex, weight) %>% 
  mutate(
    weight_g = weight / 1000, 
    weight_lb = weight / 2.2, 
    something = weight_g * weight_lb
  )

our_data %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

our_data %>% 
  group_by(sex, species_id) %>% 
  summarize(
    weight,
    mean_weight = mean(weight, na.rm = TRUE)
  )


our_data %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>%
  arrange(min_weight)  


our_data %>% 
  count(sex, species_id, sort = TRUE)

our_data %>% 
  filter(!is.na(weight), !is.na(sex)) %>% 
  ggplot(mapping = aes(x = sex, y = weight)) +
  #geom_point(alpha = 0.1)
  geom_jitter(alpha = 0.1) + 
  geom_boxplot() +
  facet_wrap(~species_id, scales = "free_y")


our_data %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.1, aes(colour = factor(plot_id)))


our_data %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) + 
  # geom_point(colour = "purple")
  geom_point(aes(colour = "purple"))


# Welcome to day 3!!!!



