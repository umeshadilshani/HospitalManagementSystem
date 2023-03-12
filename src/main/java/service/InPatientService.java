/**
 * @author Silva T.U.D
 */

package service;

import model.InPatient;

// Method definitions related to the inpatient services class
public interface InPatientService {
	public String addInPatient(InPatient inPatient);
	
	public InPatient checkIpID(InPatient inPatient);
	
	public int updateInPatient(InPatient inPatient);
}
