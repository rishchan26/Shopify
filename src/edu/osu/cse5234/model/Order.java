package edu.osu.cse5234.model;
import java.util.*;

import edu.osu.cse5234.business.view.Item;
public class Order {
	List<Item> items = new ArrayList<Item>();

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	} 
	
}
