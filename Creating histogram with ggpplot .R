# Creating Histogram in R programming
### make sure to install all the packages below. 
pacman::p_load(datasets, pacman, psych, rio, tidyverse)


### drawing a bell curve. The probability density function pdf for 
### for a standard normal distribution 

p <- ggplot(data = data.frame(x = c(-5, 5)), mapping = aes(x = x))
p + stat_function(fun =  dnorm, 
                  size = 2, 
                  color = "red") + 
                  xlab("z-scores") + 
                  ylab("Relative Frequency")


### Drawing a histogram for a standard normal distribution 
philant <- rnorm(10000) 
ggplot(NULL, aes( x= philant)) + 
  geom_histogram(binwidth = 0.5, fill = "red", color = "white")+
  xlab("z-scores") + 
  ylab("Relative Frequency")

### Using the Iris dataset 
view(iris)
glimpse(iris)
attach(iris)

### Basic statistics 
qplot(Petal.Length, geom = "histogram", data = iris)

ggplot(data = iris, mapping = aes(x = Petal.Length,)) +
  geom_histogram() 

## Showing the density plot colored by group
qplot(Petal.Length, geom = "histogram", fill = Species, data = iris)
qplot(Petal.Length, geom = "density", fill = Species, data = iris)


### Using ggplot
iris %>% 
  ggplot(mapping = aes(x= Petal.Length, fill = Species)) +
  geom_histogram(alpha = .5) + 
  theme(legend.position = "bottom")


iris %>% 
  ggplot(mapping = aes(x= Petal.Length, fill = Species)) +
  geom_density(alpha = .5) + 
  theme(legend.position = "bottom")
