function validateForm() {
    let valReportdate = document.forms["formContact"]["Report_Date"].value;
    let valname = document.forms["formContact"]["patient_name"].value;
    let valemail = document.forms["formContact"]["email"].value;
    let valgender = document.forms["formContact"]["Gender"].value;
    let valAge = document.forms["formContact"]["Age"].value;
    let valSpecimen_no = document.forms["formContact"]["Specimen_no"].value;
    let valSpecimen_collect_D = document.forms["formContact"]["Specimen_collect_D"].value;
    let valTest_conductor = document.forms["formContact"]["Test_conductor"].value;
    let valHemoglobin_R = document.forms["formContact"]["Hemoglobin_R"].value;
    let valWBC_R = document.forms["formContact"]["WBC_R"].value;
    let valRBC_R = document.forms["formContact"]["RBC_R"].value;
    let valMCV_R = document.forms["formContact"]["MCV_R"].value;
    let valBloodSugar_R = document.forms["formContact"]["BloodSugar_R"].value;
    let valCholesterol_R = document.forms["formContact"]["Cholesterol_R"].value;
    

    
    
    if (valReportdate == ""||valReportdate == null) {
      alert("Report date must be filled out");
      return false;
    }
    if (valname == ""||valname == null) {
      alert("Name must be filled out");
      return false;
    }
    else if (valemail == ""||valemail == null){
      alert("Email must be filled out");
      return false;
    }
    else if (valgender == ""||valgender == null){
      alert("Gender must be filled out");
      return false;
    }
    else if (valAge == ""||valAge == null){
      alert("Age must be filled out");
      return false;
    }
    else if (valSpecimen_no == ""||valSpecimen_no == null){
      alert("Specimen no must be filled out");
      return false;
    }
    else if (valSpecimen_collect_D == ""||valSpecimen_collect_D == null){
      alert("Specimen collect Date must be filled out");
      return false;
    }
    else if (valTest_conductor == ""||valTest_conductor == null){
      alert("Test conductor must be filled out");
      return false;
    }
    else if (valHemoglobin_R == ""||valHemoglobin_R == null){
      alert("Hemoglobin result must be filled out");
      return false;
    }
    else if (valWBC_R == ""||valWBC_R == null){
      alert("WBC result must be filled out");
      return false;
    }
    else if (valRBC_R == ""||valRBC_R == null){
      alert("RBC result must be filled out");
      return false;
    }
    else if (valMCV_R == ""||valMCV_R == null){
      alert("MCV result must be filled out");
      return false;
    }
    else if (valBloodSugar_R == ""||valBloodSugar_R == null){
      alert("BloodSugar result must be filled out");
      return false;
    }
    else if (valCholesterol_R == ""||valCholesterol_R == null){
      alert("Cholesterol result must be filled out");
      return false;
    }
    else {
    alert("The form was submitted");
    }
   
  }