package service;

import model.Stock;

public interface StockService {
	public String addStock(Stock stock);
	
	public Stock checkMedID(Stock stock);
	
	public String removeStock(Stock stock);
	
	public int updateMed(Stock stock);
}
