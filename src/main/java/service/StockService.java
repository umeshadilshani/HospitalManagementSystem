/**
 * @author Silva T.U.D
 */

package service;

import model.Stock;

// Method definitions related to the stock services class
public interface StockService {
	public String addStock(Stock stock);
	
	public Stock checkMedID(Stock stock);
	
	public String removeStock(Stock stock);
	
	public int updateMed(Stock stock);
}
