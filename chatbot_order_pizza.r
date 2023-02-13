print("welcome to pizza shop")
print("Hello customer")
print("What pizza order?")
print("1:Seafood 300$ 2:Chicken 200$ 3:Hawaiian 150$")
orders <- readLines (con="stdin", n=1)

#order Pizza
if (orders == "1") {
  print("Seafoos pizza price 300$")
  pizza_price <- 300
} else {
  if (orders == "2") {
    print("Chicken pizza price 200$")
    pizza_price <- 200
  }
  else {
    if(orders == "3") {
      print ("Hawaiian pizza price 150$")
      pizza_price <- 150
    }
    else {
      print ("Please try again...")
    }
  }
}

print ("-------------------------------------------------------")
print("select size pizza")
print("1:Large +50$  2:Medium +30$ 3:Small +10$")
size <- readLines (con="stdin", n=1)

#size pizza
if (size == "1") {
  print("Large pizza price +50$")
  size_price <- 50
} else {
  if (size == "2") {
    print ("Medium pizza price +30$")
    size_price <- 30
  } else {
    if (size == "3") {
      print("Small pizza price +10$")
      size_price <- 10
    }
  }
}

print ("-------------------------------------------------------")
print("Would you like an appetizer ?")
print("1:Yes  2:No ")
answer <- readLines (con="stdin", n=1)

#appetizer
if(answer == "1") {
  print ("Appetizer menu")
  print ("1:Cheese Sticks 30$ 2:Fish Fingers 35$ 3:Garlic Bread 40$ 4:Baked Spinach 50$")
  appetizer <- readLines (con="stdin", n=1)
  if( appetizer == "1") {
    print("Cheese Sticks 30$")
    appetizer_price <- 30
  } else {
    if (appetizer == "2") {
      print("Fish Fingers 35$")
      appetizer_price <- 35
    } else {
      if (appetizer == "3") {
      print("Garlic Bread 40$")
      appetizer_price <- 40
    } else {
      if(appetizer == "4") {
      print("Baked Spinach 50$")
      appetizer_price <- 50
        } else {"No order"
          appetizer_price <- 0 
    }
  }
}
    } 
  } else if (answer == "2") {
    appetizer <- 0
    appetizer_price <- 0 
    "No order"
  }
 
print ("-------------------------------------------------------")
print("what drink order")
print("1:Coke 15$  2:Sprite 10$ 3:Plain Water 12$ 4:No drink")
drink <- readLines(con="stdin", n=1)

#drink
if(drink == "1") {
  print("Coke prict 15$")
  drink_price <- 15
} else {
  if(drink == "2") {
    print("Sprite 10$")
    drink_price <- 10 
  } else {
    if(drink == "3") {
      print ("Plain Water 12$")
      drink_price <- 12
    } else {
      if(drink == "4") {
        print ("No drink")
        drink_price <- 0
      }
    }
         
  }
}

print ("-------------------------------------------------------")
print("Here is your order")

if(orders == 1) {
  ordersp <- "Seafood"
} else if (orders == 2) {
  ordersp<- "Chicken"
} else {
  ordersp<- "Hawaiian"
}

if (size == 1) {
  sizep <- "Large"
} else if (size == 2) {
  sizep <- "Medium"
} else {
  sizep <- "Small"
}

if(appetizer == 1) {
  appetizerp <- "Cheese Sticks"
} else if (appetizer == 2) {
  appetizerp <- "Fish Fingers"
} else if (appetizer == 3) {
  appetizerp <- "Garlic Bread"
} else if (appetizer == 4) {
  appetizerp <- "Baked Spinach"
} else if (appetizer == 0){
  appetizerp <- "No order"
}

if(drink == 1) {
  drinkp <- "Coke"
} else if (drink == 2) {
  drinkp <- "Sprite"
} else if (drink == 3) {
  drinkp <- "Plain Water"
} else { 
  drinkp <- "No order"
}

print(paste("Your order pizza is",ordersp))
print(paste("size pizza is",sizep))
print(paste("appetizer is",appetizerp))
print(paste("Drink is",drinkp))

cost <- c(pizza_price,size_price,appetizer_price,drink_price)
cost_total <- sum(cost)

print(paste("Cost Total order",cost_total,"$"))
