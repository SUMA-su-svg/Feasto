package com.foodapp.model;

public class CartItem {

	private int restaurantId;
    private int itemId;
    private String itemName;
    private double price;
    private int quantity;
    private String imageUrl;

    public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public CartItem(int itemId, String itemName, double price, int quantity, String imageUrl) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
    }
	
	public CartItem(int restaurantId, int itemId, String itemName,
            double price, int quantity, String imageUrl)
	{
		this.restaurantId = restaurantId;
		this.itemId = itemId;
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
		this.imageUrl = imageUrl;
	}
 
	public int getRestaurantId() {
	    return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
	    this.restaurantId = restaurantId;
	}

    public String getImageUrl() {
        return imageUrl;
    }

    public int getItemId() 
    {
    	return itemId;
    }
    
    public String getItemName() 
    {
    	return itemName; 
    }
    
    public double getPrice() 
    {
    	return price; 
    }
    
    
    public int getQuantity() 
    { 
    	return quantity;
    }

    public void setQuantity(int quantity) 
    {
        this.quantity = quantity;
    }
      
    public double getTotalPrice()
    {
    	return quantity*price;
    }


   
}