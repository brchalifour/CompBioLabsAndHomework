
## Lab 8  - Explanation of the Logistic Growth Model Function

Here, we use the discrete-time logistic growth equation, used in many models of population abundance over time. This equation is outlined below:

`n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )`

According to Wikipedia:

> Most populations do not grow exponentially, rather they follow a [logistic model](https://en.m.wikipedia.org/wiki/Logistic_function "Logistic function"). Once the population has reached its [carrying capacity](https://en.m.wikipedia.org/wiki/Carrying_capacity "Carrying capacity"), it will stabilize and the exponential curve will level off towards the carrying capacity, which is usually when a population has depleted most its natural resources. 

We can define the parameters of our model by defining the variables given above. These being...

* t is the time a population grows
* r is the intrinsic growth rate
* K is the carrying capacity of a population
*  n is the population abundance

### Goal

Our goal with this code is to write a function that will return a plot of abundances per generations, given four arguments. The arguments included in the function should be:

1. r
2. K
3. total number of generations
4. initial population size

### Creating the Code

We begin by naming the function and giving these arguments: 

`logisticgrowth <- function ( r, K, time, init_pop) {`

We then use our parameters to pre-allocate data storage.

`abundance <- rep(init_pop, time) `
`generations <- 1:time`

We then need to define certain variables within the logistic growth equation in accordance with our named variables.

`t <- 1`
`n <- abundance`
`end_time <- length(generations)`

Now we can write a for loop to interpret this equation. 

```
for (t in 2:end_time) {
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
}
abundance <- n
(plot(generations, abundance)) 
return ( data.frame(Generations = generations, Abundance = abundance))
} 
```

### Example - Using the Function

We can test this function using some example parameters. These include:

`n[1] = 2500, K = 10000, time = 12, and r = 0.8`

When we use our function with these inputs we use:

`logisticgrowth( 0.8, 10000, 12, 2500)`

This gives us a beautiful plot of abundances over time, along with a table of results.  This example graph is given below:

![Example graph of logistic growth model](https://lh3.googleusercontent.com/XIVVDN1uVAogZ6Vem5apHetOxgmYH4E48C9t5A4qPEU_LszUZqMS9n9kBOCARse5BH-BUm8l4giK "Example Logistic Growth Graph")

To then write these results to a new .csv file, we just assign the results to a new variable and use write.csv()

```
myLogisticResults <- logisticgrowth( 0.8, 10000, 12, 2500 )

write.csv(myLogisticResults, "~bridgetchalifour/Desktop/Grad_School/CompBio/CompBioLabsAndHomework/Labs/Lab08/Lab8Results.csv", row.names = FALSE)

```

And we're done!





> Written with [StackEdit](https://stackedit.io/).
