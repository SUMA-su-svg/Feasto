package com.foodapp.dao;

import java.util.List;
import com.foodapp.model.Menu;

public interface MenuDAO {

    List<Menu> getMenuByRestaurantId(int restaurantId);

    Menu getMenuById(int menuId);

}