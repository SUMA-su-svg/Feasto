package com.foodapp.model;

public class Restaurant {

    private int restaurantId;
    private String name;
    private String address;
    private String phone;
    private double rating;
    private String image;

    public Restaurant() {}

    public Restaurant(String name,String address,String phone,double rating,String image) {

        this.name = name;
        this.setAddress(address);
        this.setPhone(phone);
        this.setRating(rating);
        this.setImage(image);
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}