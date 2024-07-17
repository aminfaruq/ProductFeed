# Product Feed App – Image Feed Feature
[![CI](https://github.com/aminfaruq/ProductFeed/actions/workflows/CI.yml/badge.svg)](https://github.com/aminfaruq/ProductFeed/actions/workflows/CI.yml)

## BDD Specs

### Story: Customer requests to see their product image

### Narrative #1

```
As an online customer
I want the app to automatically load my latest image feed
So I can always enjoy the newest product on my feed
```

#### Scenarios (Acceptance criteria)

```
Given the customer has connectivity
 When the customer requests to see their feed
 Then the app should display the latest feed from remote
  And replace the cache with the new feed
```

### Narrative #2
```
As an online customer
I want to add the selected product to my wishlist so that I can buy it in the future.
```

#### Scenarios (Acceptance criteria)
```
Given the customer button save to wishlist 
 when the customer click button the product can save into local database
 Then wishlist product should display on wishlist page
```

### Narrative #3
```
As an online/offline customer
I want to remove the selected product from the wishlist page if I don't need that product.
```

#### Scenarios (Acceptance criteria)
```
Given the customer, button remove from wishlist page 
 When the customer clicks the button, the product is removed from the local database.
 Then The wishlist product shouldn't be displayed on the wishlist page.
```

## Use Cases
