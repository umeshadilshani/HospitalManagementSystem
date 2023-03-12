<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hope</title>

<style><%@include file="../css/addLabReports.css"%></style>

<script><%@include file="../js/addLabReports.js"%></script>
</head>
<body>
	<div class="form-container">
            <form name="formContact" method="post" action="AddReport" onsubmit="return validateForm()">
            <h1>Add report</h1>
                <table class="one">
                        <tr>
                            <!--<td>
                                <div class="input-row">
                                <label >Report ID</label> <br><input type="text" class="input-field" name="">
                                </div>
                            </td> -->
                            
                            <td colspan="2">
                                <div class="input-row">
                                <label >Report Date</label> <br><input type="date" class="input-field" name="Report_Date">
                                </div>
                            </td>
                        </tr> 

                        <tr>
                            <td colspan="2"><br><div class="input-row">Patient's Details</div><hr><br></td>
                            
                        </tr>
                        <tr>
                            <td>
                                <div class="input-row">
                                <label >Name</label> <br><input type="text" class="input-field" placeholder = "Patient's full name" name="patient_name">
                                </div>
                            </td>
                        
                            <td>
                                <div class="input-row">
                                <label >Email</label><br> <input type="text" class="input-field" class="input-field" name="email">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-row">
                                <label >Gender</label> <br><input type="text" class="input-field" name="Gender">
                                </div>
                            </td>
                    
                            <td>
                                <div class="input-row">
                                <label >Age</label><br> <input type="text" class="input-field" name="Age">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><br><div class="input-row">Specimen Details</div><hr><br></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-row">
                                <label >Specimen No</label><br> <input type="number" class="input-field" name="Specimen_no">
                                </div>
                            </td>

                            <td>
                                <div class="input-row">
                                <label for="Specimen_Type">Specimen Type</label><br>

                                    <select id="Specimen_Type" class="input-field" name="Specimen_type">
                                    <option value="Blood">Blood</option>
                                    <option value="Urine">Urine</option>
                                    <option value="B_fluids">other bodily fluids </option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-row">
                                <label >Specimen Collect Date</label> <br><input type="date" class="input-field" name="Specimen_collect_D">
                                </div>
                            </td>
                    
                            <td>
                                <div class="input-row">
                                <label >Test Conductor</label><br> <input type="text" class="input-field" name="Test_conductor">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><br><hr><br></td>
                        </tr>
                        
                    <!--</form>-->
                </table>
            
                <table class="two">
                	<tr>
                        <th style="width:30%">
                            <label class="input-row">Test</label>
                        </th>
                        <th style="width:15%">
                            <label class="input-row">Units</label>
                        </th>
                        <th style="width:30%">
                            <label class="input-row">Reference value</label>
                        </th>
                        <th style="width:25%">
                            <label class="input-row">Result</label>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <label class="input-row">Hemoglobin</label>
                        </td>
                        <td>
                            <label class="input-row">gr/l</label>
                        </td>
                        <td>
                            <label class="input-row">M 130-160 , W 120-140</label>
                        </td>
                        <td>
                            <input type="text" class="input-field" name="Hemoglobin_R">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="input-row">White Blood Cell</label>
                        </td>
                        <td>
                            <label class="input-row">m/mcl</label>
                        </td>
                        <td>
                            <label class="input-row">4,0-9,0</label>
                        </td>
                        <td>
                            <input type="text" class="input-field" name="WBC_R">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="input-row">Red Blood Cell</label>
                        </td>
                        <td>
                            <label class="input-row">m/mcl</label>
                        </td>
                        <td>
                            <label class="input-row">M 4,6-6,2 W 4,2-5,4</label>
                        </td>
                        <td>
                            <input type="text" class="input-field" name="RBC_R">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="input-row">MCV</label>
                        </td>
                        <td>
                            <label class="input-row">mm/ml</label>
                        </td>
                        <td>
                            <label class="input-row">80,0 - 97,0</label>
                        </td>
                        <td>
                            <input type="text" class="input-field" name="MCV_R">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="input-row">Blood Sugar</label>
                        </td>
                        <td>
                            <label class="input-row">mmol/l</label>
                        </td>
                        <td>
                            <label class="input-row">3,5-5,5</label>
                        </td>
                        <td>
                            <input type="text" class="input-field" name="BloodSugar_R">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="input-row">Cholesterol</label>
                        </td>
                        <td>
                            <label class="input-row">mmol/l</label>
                        </td>
                        <td>
                            <label class="input-row">3,5-5,5</label>
                        </td>
                        <td>
                            <input type="text" class="input-field" name="Cholesterol_R">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <br><label class="input-row">Notes</label><br>
                            <textarea name="notes" class="input-msgfield" placeholder = "other notes...."></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <br> <br><input type="submit" name="submit" class="btn-submit" value="Check & Submit" onclick=/>
                        </td>
                    </tr>

                
                </table>
         </form>
     </div>
</body>
</html>